//
//  YYAPIConfig.swift
//  YYImprove
//
//  Created by canyou on 2018/5/21.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit

let baseApiProduction: URL = URL.init(string: "http://apicloud.mob.com")!
let baseApiDevelopment: URL = URL.init(string: "http://apicloud.mob.com")!

let headerFields: [String: String] = ["platform": "iOS",
                                      "sys_ver": Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String,
                                      "language": UIDevice.deviceLanguage]

let mobAppKey: NSString = "25886d42994ac"
