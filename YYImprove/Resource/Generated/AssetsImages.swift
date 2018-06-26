// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias Image = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "ImageAsset")
internal typealias AssetType = ImageAsset

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Login {
    internal static let lastLoginTip = ImageAsset(name: "lastLoginTip")
    internal static let loginAccountW = ImageAsset(name: "login_account_w")
    internal static let loginInvisibleW = ImageAsset(name: "login_invisible_w")
    internal static let loginPasswordW = ImageAsset(name: "login_password_w")
    internal static let loginVisibleW = ImageAsset(name: "login_visible_w")
    internal static let registerAndLoginQqButton = ImageAsset(name: "registerAndLogin_qq_button")
    internal static let registerAndLoginWechatButton = ImageAsset(name: "registerAndLogin_wechat_button")
    internal static let registerAndLoginWeiboButton = ImageAsset(name: "registerAndLogin_weibo_button")
  }
  internal enum Navication {
    internal static let navBackB = ImageAsset(name: "nav_back_b")
    internal static let navBackW = ImageAsset(name: "nav_back_w")
    internal static let navDownloadW = ImageAsset(name: "nav_download_w")
    internal static let navHistoryW = ImageAsset(name: "nav_history_w")
    internal static let navMessageW = ImageAsset(name: "nav_message_w")
    internal static let navSearchSmallW = ImageAsset(name: "nav_search_small_w")
    internal static let navSearchW = ImageAsset(name: "nav_search_w")
    internal static let navSettingW = ImageAsset(name: "nav_setting_w")
    internal static let photoVerybig = ImageAsset(name: "photo_verybig")
    internal static let tabFavor = ImageAsset(name: "tab_favor")
    internal static let tabFavorSelected = ImageAsset(name: "tab_favor_selected")
    internal static let tabHome = ImageAsset(name: "tab_home")
    internal static let tabHomeSelected = ImageAsset(name: "tab_home_selected")
    internal static let tabMe = ImageAsset(name: "tab_me")
    internal static let tabMeSelected = ImageAsset(name: "tab_me_selected")
    internal static let tabPhoto = ImageAsset(name: "tab_photo")
    internal static let tabPhotoSelected = ImageAsset(name: "tab_photo_selected")
    internal static let tabPlayW = ImageAsset(name: "tab_play_w")
  }
  internal enum Public {
    internal static let icNoWifi = ImageAsset(name: "ic_noWifi")
    internal static let icRightArrow = ImageAsset(name: "ic_rightArrow")
    internal static let lodingCancel = ImageAsset(name: "loding_cancel")
    internal static let playDefault = ImageAsset(name: "play_default")
  }
  internal enum Welcome {
    internal static let welcomeIcon = ImageAsset(name: "welcomeIcon")
  }

  // swiftlint:disable trailing_comma
  internal static let allColors: [ColorAsset] = [
  ]
  internal static let allImages: [ImageAsset] = [
    Login.lastLoginTip,
    Login.loginAccountW,
    Login.loginInvisibleW,
    Login.loginPasswordW,
    Login.loginVisibleW,
    Login.registerAndLoginQqButton,
    Login.registerAndLoginWechatButton,
    Login.registerAndLoginWeiboButton,
    Navication.navBackB,
    Navication.navBackW,
    Navication.navDownloadW,
    Navication.navHistoryW,
    Navication.navMessageW,
    Navication.navSearchSmallW,
    Navication.navSearchW,
    Navication.navSettingW,
    Navication.photoVerybig,
    Navication.tabFavor,
    Navication.tabFavorSelected,
    Navication.tabHome,
    Navication.tabHomeSelected,
    Navication.tabMe,
    Navication.tabMeSelected,
    Navication.tabPhoto,
    Navication.tabPhotoSelected,
    Navication.tabPlayW,
    Public.icNoWifi,
    Public.icRightArrow,
    Public.lodingCancel,
    Public.playDefault,
    Welcome.welcomeIcon,
  ]
  // swiftlint:enable trailing_comma
  @available(*, deprecated, renamed: "allImages")
  internal static let allValues: [AssetType] = allImages
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

internal extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
