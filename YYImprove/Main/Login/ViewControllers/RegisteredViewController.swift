//
//  RegisteredViewController.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/5/24.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import SwiftMessages

// MARK: - 常量
private struct Metric {
    
    static let fieldHeight: CGFloat = 45.0
}

class RegisteredViewController: YYBaseViewController {

    let lblTitle = UILabel().then {
//        $0.font = UIFont(name: "PartyLetPlain", size: 45)
        $0.font = UIFont(name: "SavoyeLetPlain", size: 60)
//        $0.font = UIFont(name: "Zapfino", size: 35)
        $0.textAlignment = .center
        $0.text = "Improve"
        $0.textColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView = initTitleView(title: "注册")
        titleView?.backgroundColor = UIColor.clear
        
        self.initSubViewControllers()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 启用滑动返回
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension RegisteredViewController: YYAccountLoginabel {
    
    private func initSubViewControllers() {
        let gradient: CAGradientLayer = [
            UIColor(hex: "#78C9CC"),
            UIColor(hex: "#3bb2bb")
            ].gradient { gradient in
                gradient.speed = 1
                gradient.timeOffset = 3
                gradient.locations = [0.0, 1.0]
                gradient.startPoint = CGPoint(x: 1, y: 0)
                gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
                gradient.frame = self.view.frame
                return gradient
        }
        self.view.layer.addSublayer(gradient)
        
        self.view.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview()
        }
        
//        self.initEnableMudule()
    }
    
//    // MARK: - 初始化 登录 输入框
//    private func initEnableMudule() {
//
//        // 创建 容器组件
//        let scrollView = UIScrollView().then {
//            $0.showsHorizontalScrollIndicator = false
//            $0.showsVerticalScrollIndicator = false
//        }
//
//    }
    
}
