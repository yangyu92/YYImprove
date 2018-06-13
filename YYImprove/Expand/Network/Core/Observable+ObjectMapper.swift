//
//  RxSwiftMoyaError.swift
//  YYImprove
//
//  Created by YY on 2018/6/12.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

enum RxSwiftMoyaError: Swift.Error {
    case parseJSONError
    case noRepresentor
    case notSuccessfulHTTP
    case noData
    case couldNotMakeObjectError
    case bizError(resultCode: String, resultMsg: String)
    case requestFailed
    case noResponse
}

extension RxSwiftMoyaError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .parseJSONError:
            return "数据解析失败"
        case .noRepresentor:
            return "NoRepresentor."
        case .notSuccessfulHTTP:
            return "NotSuccessfulHTTP."
        case .noData:
            return "NoData."
        case .couldNotMakeObjectError:
            return "CouldNotMakeObjectError."
        case .bizError(resultCode: let resultCode, resultMsg: let resultMsg):
            return "错误码: \(resultCode), 错误信息: \(resultMsg)"
        case .requestFailed:
            return "网络请求发生错误"
        case .noResponse:
            return "接收到的返回没有data"
        }
    }
}

extension Observable {
    func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return map { response in
            //返回response
            guard let response = response as? Moya.Response else {
                throw RxSwiftMoyaError.noResponse
            }
            //检查状态码
            guard (200...209) ~= response.statusCode else {
                throw RxSwiftMoyaError.requestFailed
            }
            guard let dict = try? JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions(rawValue: 0))  as! [String: Any] else {
                throw RxSwiftMoyaError.parseJSONError
            }
//            guard let dict = response.data as? [String: Any] else {
//                throw RxSwiftMoyaError.parseJSONError
//            }
            return Mapper<T>().map(JSON: dict)!
        }
    }
    
    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            //if response is an array of dictionaries, then use ObjectMapper to map the dictionary
            //if not, throw an error
            guard let array = response as? [[String: Any]] else {
                throw RxSwiftMoyaError.parseJSONError
            }
            return Mapper<T>().mapArray(JSONArray: array)
        }
    }
}
