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

extension RegisteredViewController: HCAccountLoginable {
    
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
        
        self.initEnableMudule()
    }
    
    // MARK: - 初始化 登录 输入框
    private func initEnableMudule() {
        
        // 创建 容器组件
        let scrollView = UIScrollView().then {
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
        }
        
        // 创建 协议组件
        let accountField = initAccountField { }
        let passwordField = initPasswordField { }
        let (loginBtnView, loginBtn) = initLoginBtnView { event in
//            HCLog(event.title)
        }
//        let otherLoginView = initOtherLoginView { event in
//            HCLog(event.title)
//        }
        
//        // 创建 视图模型
//        let accountLoginView = HCAccountLoginViewModel(input: (accountField, passwordField, loginBtn), service: HCAccountLoginService.shareInstance)
//        
//        accountLoginView.accountUseable.drive(accountField.rx.validationResult).disposed(by: rx.disposeBag)
//        accountLoginView.passwordUseable.drive(passwordField.rx.validationResult).disposed(by: rx.disposeBag)
//        accountLoginView.loginBtnEnable.drive(onNext: { (beel) in
//            loginBtn.isEnabled = beel
//        }).disposed(by: rx.disposeBag)
//        
//        accountLoginView.loginResult.drive(onNext: { (result) in
//            switch result {
//            case .success:
////                HCLog("\(result.description)")
//                break
//            case .empty:
//                break
//            case .failed:
////                HCLog("\(result.description)")
//                break
//            }
//        }).disposed(by: rx.disposeBag)
        
        // 添加
        view.addSubview(scrollView)
        scrollView.addSubview(accountField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginBtnView)
//        scrollView.addSubview(otherLoginView)
        
        // 布局
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(lblTitle.snp.bottom)
            make.left.bottom.equalToSuperview()
            make.width.equalTo(kScreenWidth)
        }
        
        accountField.snp.makeConstraints { (make) in
            if kScreenWidth <= 320 {
                make.left.equalToSuperview().offset(MetricGlobal.margin * 2)
            } else {
                make.left.equalToSuperview().offset(MetricGlobal.margin * 3)
            }
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(MetricGlobal.margin * 2)
            make.height.equalTo(Metric.fieldHeight)
        }
        
        passwordField.snp.makeConstraints { (make) in
            make.left.equalTo(accountField.snp.left)
            make.right.equalTo(accountField.snp.right)
            make.top.equalTo(accountField.snp.bottom).offset(MetricGlobal.margin * 2)
            make.height.equalTo(Metric.fieldHeight)
        }
        
        loginBtnView.snp.makeConstraints { (make) in
            make.left.equalTo(accountField.snp.left)
            make.right.equalTo(accountField.snp.right)
            make.top.equalTo(passwordField.snp.bottom).offset(MetricGlobal.margin * 2)
        }
        
//        otherLoginView.snp.makeConstraints { (make) in
//            if kScreenW <= 320 {
//                make.left.equalTo(accountField.snp.left).offset(-MetricGlobal.margin * 1)
//            } else {
//                make.left.equalTo(accountField.snp.left).offset(-MetricGlobal.margin * 2)
//            }
//            make.centerX.equalToSuperview()
//            make.top.equalTo(loginBtnView.snp.bottom)
//            make.bottom.equalToSuperview()
//        }
    }
    
}
