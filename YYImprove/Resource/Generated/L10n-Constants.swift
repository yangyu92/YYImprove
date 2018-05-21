// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {
  /// 发现
  internal static let tabTitleFavor = L10n.tr("Localizable", "TabTitleFavor")
  /// 首页
  internal static let tabTitleHome = L10n.tr("Localizable", "TabTitleHome")
  /// 我的
  internal static let tabTitleMe = L10n.tr("Localizable", "TabTitleMe")
  /// 文章
  internal static let tabTitlePhoto = L10n.tr("Localizable", "TabTitlePhoto")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
