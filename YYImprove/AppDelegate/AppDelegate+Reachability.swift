//
//  AppDelegate+Reachability.swift
//  YYImprove
//
//  Created by canyou on 2018/5/25.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import Foundation
import Reachability

var reachability: Reachability?

extension AppDelegate {
    
    func setupReachability() {
        
        reachability = Reachability()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            log.error("启动网络监听失败")
        }
    }
    func stopNotifier() {
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
        reachability = nil
    }
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:
            log.info("有wifi")
            self.showAlert("提示", message: "有wifi")
        case .cellular:
            log.info("移动网络")
            self.showAlert("提示", message: "移动网络")
        case .none:
            log.info("没有网络")
            self.showAlert("提示", message: "没有网络")
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
