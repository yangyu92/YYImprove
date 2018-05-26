//
//  SwiftMessageExtensions.swift
//  YYImprove
//
//  Created by canyou on 2018/5/25.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import Foundation
import SwiftMessages

extension SwiftMessages {
    
    /// 显示消息
    ///
    /// - Parameter msg: 提示信息
    public static func showInfo(msg: String) {
        var config = SwiftMessages.defaultConfig
//        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.presentationStyle = .center
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.info, iconStyle: .light)
        view.accessibilityPrefix = "info"
        view.configureDropShadow()
        view.titleLabel?.isHidden = true
        view.button?.isHidden = true
        view.bodyLabel?.text = msg
        SwiftMessages.show(config: config, view: view)
    }
    
    /// 成功提示
    ///
    /// - Parameter msg: 提示信息
    public static func showSuccess(msg: String) {
        var config = SwiftMessages.defaultConfig
//        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.presentationStyle = .center
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.success, iconStyle: .light)
        view.accessibilityPrefix = "success"
        view.configureDropShadow()
        view.titleLabel?.isHidden = true
        view.button?.isHidden = true
        view.bodyLabel?.text = msg
        SwiftMessages.show(config: config, view: view)
    }
    
    /// 警告提示
    ///
    /// - Parameter msg: 提示信息
    public static func showWarning(msg: String) {
        var config = SwiftMessages.defaultConfig
//        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.presentationStyle = .center
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.warning, iconStyle: .light)
        view.accessibilityPrefix = "warning"
        view.configureDropShadow()
        view.titleLabel?.isHidden = true
        view.button?.isHidden = true
        view.bodyLabel?.text = msg
        SwiftMessages.show(config: config, view: view)
    }
    
    /// 错误提示
    ///
    /// - Parameter msg: 提示信息
    public static func showError(msg: String) {
        var config = SwiftMessages.defaultConfig
//        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.presentationStyle = .center
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error, iconStyle: .light)
        view.accessibilityPrefix = "error"
        view.configureDropShadow()
        view.titleLabel?.isHidden = true
        view.button?.isHidden = true
        view.bodyLabel?.text = msg
        SwiftMessages.show(config: config, view: view)
    }
    
}

extension SwiftMessages {
    
    typealias ReachabilityFunction = (_ view: BaseView) -> Void
    
    func show(reachabilityFunction: @escaping (_ view: BaseView) -> Void) {
        var config = SwiftMessages.defaultConfig
        config.duration = .forever
        config.presentationStyle = .top
        config.interactiveHide = false
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        
        var view: ReachabilityMessageView
        do {
            try view = SwiftMessages.viewFromNib()
        } catch {
            log.error("类型转换错误")
            view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error, iconStyle: .light)
            view.accessibilityPrefix = "error"
        }
        view.tapHandler = reachabilityFunction
        view.configureDropShadow()
        view.titleLabel?.isHidden = true
        view.button?.isHidden = true
        view.bodyLabel?.text = "网络状态不佳,请前往设置"
        self.show(config: config, view: view)
    }
}
