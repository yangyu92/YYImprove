//
//  AppDelegate+Reachability.swift
//  YYImprove
//  网络监测类
//  Created by canyou on 2018/5/25.
//  Copyright © 2018年 com.canyou. All rights reserved.
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
                    let navigation = tabBarController.viewControllers![tabBarController.selectedIndex] as! YYBaseNavigationController
                    navigation.pushViewController(controller, animated: true)
                }
            }
        }
    }
}
