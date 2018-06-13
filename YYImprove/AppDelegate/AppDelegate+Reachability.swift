//
//  AppDelegate+Reachability.swift
//  YYImprove
//  网络监测类
//  Created by YY on 2018/5/25.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import Reachability
import SwiftMessages

let reachability = Reachability()
let reachabilitySwiftMessage = SwiftMessages()
let lodingSwiftMessage = SwiftMessages()

extension AppDelegate {
    
    func setupReachability() {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            log.error("启动网络监听失败")
        }
    }
    
    func stopReachabilityNotifier() {
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
    }
    
    @objc private func reachabilityChanged(note: Notification) {
        reachabilityShow()
    }
    
    func reachabilityShow() {
        switch reachability!.connection {
        case .wifi, .cellular:
            reachabilitySwiftMessage.hide()
        case .none:
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                reachabilitySwiftMessage.show { _ in
                    let controller = NoneReachabilityHelpViewController()
                    var navigation = rootTabBarController.selectedViewController as! YYBaseNavigationController
                    /// 获取present之后页面的导航控制器(控制器必须是YYBaseNavigationController)
                    if let nav = appDelegate.window?.rootViewController?.presentedViewController {
                        navigation = nav as! YYBaseNavigationController
                    }
                    navigation.pushViewController(controller, animated: true)
                }
            }
        }
    }
}
