//
//  ApiManager.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/5/21.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import Moya

let apiManagerProvider = MoyaProvider<ApiManager>(endpointClosure: endpointMapping,
                                                  stubClosure: MoyaProvider.delayedStub(1), // 延迟1秒使用sampleData中的测试数据返回
                                                  plugins: [NetworkLoggerPlugin(verbose: true),
                                                            newworkActivityPlugin,
                                                            RequestLoadingPlugin(true),
                                                            AuthPlugin(token: "")])

private func endpointMapping<Target: TargetType>(target: Target) -> Endpoint {
    //log.info("请求连接：\(target.baseURL)\(target.path) \n方法：\(target.method)\n参数：\(String(describing: target.headers))")
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    let baseUrl = defaultEndpoint.url.appending("?key=\(mobAppKey)")
    return Endpoint(url: baseUrl, sampleResponseClosure: { .networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
}

enum ApiManager {
    
    /// 注册
    case rigister(username:String, password:String, email:String)
    /// 登录
    case login(phone:String, password:String)
}

extension ApiManager: TargetType, MoyaAddable {
    
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
        default:
            return "".utf8Encoded
        }
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        switch self {
        case .rigister(let username, let password, let email):
            return .requestParameters(parameters: ["username": username, "password": password, "email": email], encoding: URLEncoding.default)
        case .login(let username, let password):
            return .requestParameters(parameters: ["username": username, "password": password], encoding: URLEncoding.default)
        }
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
}
