//
//  DefaultsKeys+YYConst.swift
//  YYImprove
//  需要持久化到本地的数据key定义
//  Created by yuyangstudio on 2018/5/18.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    // 登录的用户名
    static let username = DefaultsKey<String?>("username")
    // 登录的用户token
    static let token = DefaultsKey<String?>("token")
    // app打开次数
    static let launchCount = DefaultsKey<Int>("launchCount")
}
