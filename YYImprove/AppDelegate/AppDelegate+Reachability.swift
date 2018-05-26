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
//        let reachability = note.object as! Reachability
//        switch reachability.connection {
//        case .wifi, .cellular:
//            reachabilitySwiftMessage.hide()
////            reachabilitySwiftMessage.show { _ in
////                reachabilitySwiftMessage.hide()
////            }
//        case .none:
//            reachabilitySwiftMessage.show { _ in
//                self.showAlert("提示信息", message: "点击查看网络设置")
//            }
//        }
        reachabilityShow()
    }
    
    func reachabilityShow() {
        switch reachability!.connection {
        case .wifi, .cellular:
            reachabilitySwiftMessage.hide()
        case .none:
            reachabilitySwiftMessage.show { _ in
//                self.showAlert("提示信息", message: "点击查看网络设置")
                let controller = ViewController()
                let navigation = tabBarController.viewControllers![tabBarController.selectedIndex] as! YYBaseNavigationController
                navigation.pushViewController(controller, animated: true)
            }
        }
    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
}
