//
//  YYAPIConfig.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/5/21.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

/// 生产环境下的baseUrl
let baseApiProduction: URL = URL.init(string: "http://apicloud.mob.com")!
/// 开发环境下的baseUrl
let baseApiDevelopment: URL = URL.init(string: "http://apicloud.mob.com")!

/// 请求头
let headerFields: [String: String] = ["platform": "iOS",
                                      "sys_ver": Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String,
                                      "language": UIDevice.deviceLanguage]
/// 请求key
let mobAppKey: NSString = "25886d42994ac"
