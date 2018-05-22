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

let headerFields: [String: String] = ["system": "iOS", "sys_ver": String(UIDevice.version())]

let mobAppKey: NSString = "25886d42994ac"
let publicParameters: [String: Any] = ["language": UIDevice.deviceLanguage, "key": mobAppKey]
