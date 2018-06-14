//
//  RxSwiftMoyaError.swift
//  YYImprove
//
//  Created by YY on 2018/6/12.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

public struct ResponseCode {
    static let successResponseStatus = "200"     // 接口成功调用
    static let forceLogoutError = "100000"     // 请重新登录
}

enum RxSwiftMoyaError: Swift.Error {
    case parseJSONError
    // 登录状态变化
    case loginStateIsexpired(message: String?)
    // 自定义错误
    case customException(message: String, code: String)
}

extension RxSwiftMoyaError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .parseJSONError:
            return "数据解析失败"
        case .loginStateIsexpired:
            return "token过期"
        case .customException(message: let message, code: let code):
            return "错误码: \(message), 错误信息: \(code)"
        }
    }
}

extension Observable {
    func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return map { response in
            guard let dict = response as? [String: Any] else {
                throw RxSwiftMoyaError.parseJSONError
            }
            guard  dict["retCode"] as? String == ResponseCode.successResponseStatus else {
                throw RxSwiftMoyaError.customException(message: dict["msg"] as! String, code: dict["retCode"] as! String)
            }
            return Mapper<T>().map(JSON: dict)!
        }
    }
    
    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            guard let array = response as? [[String: Any]] else {
                throw RxSwiftMoyaError.parseJSONError
            }
            return Mapper<T>().mapArray(JSONArray: array)
        }
    }
}
