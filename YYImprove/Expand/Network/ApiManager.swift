//
//  File.swift
//  YYImprove
//
//  Created by YY on 2018/6/13.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import Moya
import SwiftyUserDefaults

private func endpointMapping<Target: TargetType>(target: Target) -> Endpoint {
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    let baseUrl = defaultEndpoint.url.appending("?key=\(mobAppKey)")
    return Endpoint(url: baseUrl, sampleResponseClosure: { .networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
}

private func stubMapping<Target: TargetType>(_: Target) -> StubBehavior {
    // 实时请求api
//    return StubBehavior.never
    
    // 延迟1秒使用sampleData中的测试数据返回
    return StubBehavior.delayed(seconds: 1)
}

private struct ProviderMetric {

    /// 显示加载提示
    static let loading = MoyaProvider<MultiTarget>(endpointClosure: endpointMapping,
                                                             stubClosure: stubMapping,
        plugins: [NetworkLoggerPlugin(verbose: true),
                  newworkActivityPlugin,
                  RequestLoadingPlugin(true),
                  AuthPluginToken()])
    
    /// 不显示加载提示
    static let noLoading = MoyaProvider<MultiTarget>(endpointClosure: endpointMapping,
                                                       stubClosure: stubMapping,
        plugins: [NetworkLoggerPlugin(verbose: true),
                  newworkActivityPlugin,
                  RequestLoadingPlugin(false),
                  AuthPluginToken()])
    
}

class ApiManager {
    // 创建moya请求类
    @discardableResult
    static func provider(showLoding: Bool) -> MoyaProvider<MultiTarget> {
        if showLoding {
            return ProviderMetric.loading
        } else {
            return ProviderMetric.noLoading
        }
    }
}
