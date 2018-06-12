//
//  MoyaAddable.swift
//  YYImprove
//
//  Created by YY on 2018/6/12.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import Foundation
import Moya

protocol MoyaAddable {
//    var cacheKey: String? { get }
}

//参数统一处理
public extension TargetType {
    
    var headers: [String: String]? {
        return headerFields
    }
    
    var baseURL: URL {
        #if DEBUG
        return baseApiDevelopment
        #else
        return baseApiProduction
        #endif
    }
}
