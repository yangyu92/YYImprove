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
        }
    }
}

extension Observable {
    func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return self.map { response in
            //if response is a dictionary, then use ObjectMapper to map the dictionary
            //if not throw an error
            guard let dict = response as? [String: Any] else {
                throw RxSwiftMoyaError.parseJSONError
            }
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
