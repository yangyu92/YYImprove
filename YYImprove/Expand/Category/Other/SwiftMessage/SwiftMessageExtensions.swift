//
//  SwiftMessageExtensions.swift
//  YYImprove
//
//  Created by canyou on 2018/5/25.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import Foundation
import SwiftMessages
import NVActivityIndicatorView

extension SwiftMessages {
    
    /// 显示消息
    ///
    /// - Parameter msg: 提示信息
    public static func showInfo(msg: String) {
        showMsgPrefix(.info, message: msg)
    }
    
    /// 成功提示
    ///
    /// - Parameter msg: 提示信息
    public static func showSuccess(msg: String) {
        showMsgPrefix(.success, message: msg)
    }
    
    /// 警告提示
    ///
    /// - Parameter msg: 提示信息
    public static func showWarning(msg: String) {
        showMsgPrefix(.warning, message: msg)
    }
    
    /// 错误提示
    ///
    /// - Parameter msg: 提示信息
    public static func showError(msg: String) {
        showMsgPrefix(.error, message: msg)
    }
    
    private static func showMsgPrefix(_ theme: Theme, message: String) {
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .center
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureBackgroundView(width: 200)
        view.configureTheme(theme, iconStyle: .light)
        view.configureDropShadow()
        view.titleLabel?.isHidden = true
        view.button?.isHidden = true
        view.bodyLabel?.text = message
        SwiftMessages.show(config: config, view: view)
    }
}

extension SwiftMessages {
    
    typealias ReachabilityFunction = (_ view: BaseView) -> Void
    
    typealias CancelFunction = (_ button: UIButton) -> Void
    
    /// 显示网络状态浮动层
    ///
    /// - Parameter reachabilityFunction: 点击浮动层执行事件
    func show(reachabilityFunction: @escaping (_ view: BaseView) -> Void) {
        var config = SwiftMessages.defaultConfig
        config.duration = .forever
        config.presentationStyle = .top
        config.interactiveHide = false
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        
        var view: ReachabilityMessageView
        do {
//            let view = SwiftMessages.viewFromNib(named: "ReachabilityMessageView")
            try view = SwiftMessages.viewFromNib()
            view.tapHandler = reachabilityFunction
            view.configureDropShadow()
            view.bodyLabel?.text = "网络状态不佳,请前往设置"
            self.show(config: config, view: view)
        } catch {
            log.error("网络监测浮动层初始化失败")
            SwiftMessages.showInfo(msg: "网络监测层异常")
        }
    }
    
    /// 显示加载动画
    ///
    /// - Parameter cancelFunction: 点击取消后执行事件
    func showLoding(cancelFunction: @escaping (_ button: UIButton) -> Void) {
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindowLevelAlert)
        config.duration = .forever
        config.presentationStyle = .center
        config.interactiveHide = false
        config.dimMode = .gray(interactive: false)
        
        var view: LodingMessageView
        do {
            try view = SwiftMessages.viewFromNib()
            view.configureBackgroundView(width: 100)
            view.buttonTapHandler = cancelFunction
            view.configureDropShadow()
            view.button?.isHidden = true
            self.show(config: config, view: view)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                view.button?.isHidden = false
            }
        } catch {
            log.error("加载动画初始化失败")
            SwiftMessages.showInfo(msg: "加载动画异常")
        }
    }
}
