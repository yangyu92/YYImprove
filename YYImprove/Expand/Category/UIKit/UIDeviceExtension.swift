//
//  UIDeviceExtension.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/5/21.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

public enum DeviceModel: String {
    case iPodTouch1 = "iPod Touch 1",
        iPodTouch2 = "iPod Touch 2",
        iPodTouch3 = "iPod Touch 3",
        iPodTouch4 = "iPod Touch 4",
        iPodTouch5Gen = "iPod Touch (5 Gen)",
        iPodTouch6 = "iPod Touch 6",

    iPhone4 = "iPhone 4",
        iPhone4s = "iPhone 4s",
        iPhone5 = "iPhone 5",
        iPhone5GC = "iPhone 5 (GSM+CDMA)",
        iPhone5cG = "iPhone 5c (GSM)",
        iPhone5cGC = "iPhone 5c (GSM+CDMA)",
        iPhone5sG = "iPhone 5s (GSM)",
        iPhone5sGC = "iPhone 5s (GSM+CDMA)",
        iPhone6 = "iPhone 6",
        iPhone6Plus = "iPhone 6 Plus",
        iPhone6s = "iPhone 6s",
        iPhone6sPlus = "iPhone 6s Plus",
        iPhoneSE = "iPhone SE",
        iPhone7CDMA = "iPhone 7 (CDMA)",
        iPhone7PlusCDMA = "iPhone 7 Plus (CDMA)",
        iPhone7GSM = "iPhone 7 (GSM)",
        iPhone7PlusGSM = "iPhone 7 Plus (GSM)",
        iPhone8 = "iPhone 8",
        iPhone8Plus = "iPhone 8 Plus",
        iPhoneX = "iPhone X",

    iPad = "iPad",
        iPad3G = "iPad 3G",
        iPad2 = "iPad 2",
        iPadMini = "iPad Mini",
        iPad3 = "iPad 3",
        iPad4 = "iPad 4",
        iPadAir = "iPad Air",
        iPadMini2 = "iPad Mini 2",
        iPadMini3 = "iPad Mini 3",
        iPadMini4 = "iPad Mini 4",
        iPadAir2 = "iPad Air 2",
        iPadPro97 = "iPad Pro 9.7",
        iPadPro129 = "iPad Pro 12.9",
        appleTV2 = "Apple TV 2",
        appleTV3 = "Apple TV 3",
        appleTV4 = "Apple TV 4",
        simulator = "Simulator",
        unrecognized = "?unrecognized?"
}

// MARK: - Device information
extension UIDevice {

    public class var idForVendor: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }

    public class func systemName() -> String {
        return UIDevice.current.systemName
    }

    @objc
    public class func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }

    public class var deviceName: String {
        return UIDevice.current.name
    }

    public class var deviceLanguage: String {
        return Bundle.main.preferredLocalizations[0]
    }

    @objc public class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    @objc public class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }

}

// MARK: - Version
extension UIDevice {

    public class func isVersion(_ version: Float) -> Bool {
        return systemFloatVersion >= version && systemFloatVersion < (version + 1.0)
    }

    public class func isVersionOrLater(_ version: Float) -> Bool {
        return systemFloatVersion >= version
    }

    public class func isVersionOrEarlier(_ version: Float) -> Bool {
        return systemFloatVersion < (version + 1.0)
    }

    private class var systemFloatVersion: Float {
        return (systemVersion() as NSString).floatValue
    }

    //获取设备具体详细的型号
    var modelName: DeviceModel {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        switch identifier {
        case "iPod1,1": return .iPodTouch1
        case "iPod2,1": return .iPodTouch2
        case "iPod3,1": return .iPodTouch3
        case "iPod4,1": return .iPodTouch4
        case "iPod5,1": return .iPodTouch5Gen
        case "iPod7,1": return .iPodTouch6

        case "iPhone3,1", "iPhone3,2", "iPhone3,3": return .iPhone4
        case "iPhone4,1": return .iPhone4s
        case "iPhone5,1": return .iPhone5
        case "iPhone5,2": return .iPhone5GC
        case "iPhone5,3": return .iPhone5cG
        case "iPhone5,4": return .iPhone5cGC
        case "iPhone6,1": return .iPhone5sG
        case "iPhone6,2": return .iPhone5sGC
        case "iPhone7,2": return .iPhone6
        case "iPhone7,1": return .iPhone6Plus
        case "iPhone8,1": return .iPhone6s
        case "iPhone8,2": return .iPhone6sPlus
        case "iPhone8,4": return .iPhoneSE
        case "iPhone9,1": return .iPhone7CDMA
        case "iPhone9,2": return .iPhone7PlusCDMA
        case "iPhone9,3": return .iPhone7GSM
        case "iPhone9,4": return .iPhone7PlusGSM
        case "iPhone10,1", "iPhone10,4": return .iPhone8
        case "iPhone10,2", "iPhone10,5": return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6": return .iPhoneX

        case "iPad1,1": return .iPad
        case "iPad1,2": return .iPad3G
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
        case "iPad2,5", "iPad2,6", "iPad2,7": return .iPadMini
        case "iPad3,1", "iPad3,2", "iPad3,3": return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6": return .iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3": return .iPadAir
        case "iPad4,4", "iPad4,5", "iPad4,6": return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9": return .iPadMini3
        case "iPad5,1", "iPad5,2": return .iPadMini4
        case "iPad5,3", "iPad5,4": return .iPadAir2
        case "iPad6,3", "iPad6,4": return .iPadPro97
        case "iPad6,7", "iPad6,8": return .iPadPro129
        case "AppleTV2,1": return .appleTV2
        case "AppleTV3,1", "AppleTV3,2": return .appleTV3
        case "AppleTV5,3": return .appleTV4
        case "i386", "x86_64": return .simulator
        default: return .unrecognized
        }
    }
}

// MARK: - Rotation
#if os(iOS)
    extension UIDevice {

        public class func forceRotation(_ orientation: UIInterfaceOrientation) {
            UIDevice.current.forceRotation(orientation)
        }

        public func forceRotation(_ orientation: UIInterfaceOrientation) {
            setValue(orientation.rawValue, forKey: "orientation")
        }

    }
#endif
