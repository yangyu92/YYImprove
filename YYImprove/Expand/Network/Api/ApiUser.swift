//
//  ApiManager.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/5/21.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import Moya

enum ApiUser {
    
    /// 注册
    case rigister(username:String, password:String, email:String)
    /// 登录
    case login(phone:String, password:String)
}

extension ApiUser: TargetType, MoyaAddable {
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .rigister:
            return "/user/rigister"
        case .login:
            return "/user/login"
        }
    }
    
    /// The HTTP method used in the request.
    var method: Moya.Method {
        switch self {
        case .rigister, .login:
            return .get
        }
    }

    /// Provides stub data for use in testing.
    var sampleData: Data {
        switch self {
        case .rigister:
            return "{ \"retCode\": \"200\", \"msg\": \"success\", \"uid\": \"e5b0d1b60461ea4605cf27947f739bce\" }".utf8Encoded
        case .login:
            return "{\"msg\":\"success\",\"result\":{\"token\":\"eae502fff9c63895d5d256da51bdd34b\",\"uid\":\"92d4d01b2f24aa60dd2b5f7d10a72da4ed127ffe\"},\"retCode\":\"200\"}".utf8Encoded
        }
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        switch self {
        case .rigister(let username, let password, let email):
            var params: [String: Any] = [:]
            params["username"] = username
            params["password"] = password
            params["email"] = email
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .login(let username, let password):
            var params: [String: Any] = [:]
            params["username"] = username
            params["password"] = password
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
}
