//
//  YYConstants.swift
//  YYImprove
//
//  Created by canyou on 2018/4/28.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit

public let kSCREENWIDTH: CGFloat = UIScreen.main.bounds.size.width
public let kSCREENHEIGHT: CGFloat = UIScreen.main.bounds.size.height
public let kScreenBounds: CGRect = UIScreen.main.bounds

public let IGNavigationTitleColor = UIColor(hex: "#FFFFFF")
public let IGNavigationBackgroundColor = UIColor(hex: "78C9CC")

let kThemeWhiteColor = UIColor(hex: "#FFFFFF")

//适配iPhoneX
let isIPhoneX = (kSCREENWIDTH == 375.0 && kSCREENHEIGHT == 812.0 ? true : false)
let kNavibarH: CGFloat = isIPhoneX ? 88.0 : 64.0
let kTabbarH: CGFloat = isIPhoneX ? 49.0+34.0 : 49.0
let kStatusbarH: CGFloat = isIPhoneX ? 44.0 : 20.0
let iPhoneXBottomH: CGFloat = 34.0
let iPhoneXTopH: CGFloat = 24.0

// MARK: - 常量
struct MetricGlobal {
    static let padding: CGFloat = 10.0
    static let margin: CGFloat = 10.0
}
