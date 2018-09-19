//
//  YYConstants.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/4/28.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

public let kScreenWidth: CGFloat = UIScreen.main.bounds.size.width
public let kScreenHeight: CGFloat = UIScreen.main.bounds.size.height
public let kScreenBounds: CGRect = UIScreen.main.bounds

public let kNavigationTitleColor = UIColor(hex: "#FFFFFF")
public let kNavigationBackgroundColor = UIColor(hex: "78C9CC")

public let kThemeWhiteColor = UIColor(hex: "#FFFFFF")
public let kThemeWhiteSmokeColor = UIColor(hex: "#F5F5F5")
public let kThemeMistyRoseColor = UIColor(hex: "#FFE4E1")  // 薄雾玫瑰
public let kThemeGainsboroColor = UIColor(hex: "#F3F4F5")  // 亮灰色
public let kThemeOrangeRedColor = UIColor(hex: "#FF4500")  // 橙红色
public let kThemeLimeGreenColor = UIColor(hex: "#32CD32")  // 酸橙绿
public let kThemeSnowColor = UIColor(hex: "#FFFAFA")
public let kThemeLightGreyColor = UIColor(hex: "#D3D3D3")
public let kThemeGreyColor = UIColor(hex: "#A9A9A9")
public let kThemeTomatoColor = UIColor(hex: "#F7583B")
public let kThemeDimGrayColor = UIColor(hex: "#696969")
public let kThemeBlackColor = UIColor(hex: "#000000")
public let kThemeBackgroundColor = UIColor(hex: "#F4F4F4")

//判断iPhoneX
public func isIPhoneX() -> Bool {
    if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.phone {
        return false
    }
    guard #available(iOS 11.0, *) else {
        return false
    }
    return UIApplication.shared.windows[0].safeAreaInsets.bottom > 0.0
}

// MARK: - 常量
struct MetricGlobal {
    
    // 绘制一像素的线
    static let kSingleLineWidth: CGFloat = (1 / UIScreen.main.scale)
    static let kSingleLineAdjustOffset: CGFloat = ((1 / UIScreen.main.scale) / 2)

    static let padding: CGFloat = 10.0
    static let margin: CGFloat = 10.0
    
    /// 导航按钮大小
    static let navigationItemSize: CGFloat = 30
    
    //适配iPhoneX
    static let kNavigationTabbarHight: CGFloat = isIPhoneX() ? 88.0 : 64.0
    static let kTabbarHight: CGFloat = isIPhoneX() ? 49.0 + 34.0 : 49.0
    static let kStatusbarHight: CGFloat = UIApplication.shared.statusBarFrame.height
    static let kNavigationTitleHight: CGFloat = 44.0
    static let kIPhoneXBottomHight: CGFloat = 34.0
    static let kIPhoneXTopHight: CGFloat = 24.0
}
