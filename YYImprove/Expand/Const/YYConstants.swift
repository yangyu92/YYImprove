//
//  YYConstants.swift
//  YYImprove
//
//  Created by canyou on 2018/4/28.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit

public let kScreenWidth: CGFloat = UIScreen.main.bounds.size.width
public let kScreenHeight: CGFloat = UIScreen.main.bounds.size.height
public let kScreenBounds: CGRect = UIScreen.main.bounds

public let kNavigationTitleColor = UIColor(hex: "#FFFFFF")
public let kNavigationBackgroundColor = UIColor(hex: "78C9CC")

public let kThemeWhiteColor = UIColor(hex: "#FFFFFF")

//判断iPhoneX
public let isIPhoneX = (kScreenWidth == 375.0 && kScreenHeight == 812.0 ? true : false)

// MARK: - 常量
struct MetricGlobal {
    static let padding: CGFloat = 10.0
    static let margin: CGFloat = 10.0
    
    /// 导航按钮大小
    static let navigationItemSize: CGFloat = 30
    
    //适配iPhoneX
    static let kNavigationTabbarHight: CGFloat = isIPhoneX ? 88.0 : 64.0
    static let kTabbarHight: CGFloat = isIPhoneX ? 49.0 + 34.0 : 49.0
    static let kStatusbarHight: CGFloat = isIPhoneX ? 44.0 : 20.0
    static let kNavigationTitleHight: CGFloat = 44.0
    static let kIPhoneXBottomHight: CGFloat = 34.0
    static let kIPhoneXTopHight: CGFloat = 24.0
}
