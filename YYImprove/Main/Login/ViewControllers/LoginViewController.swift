//
//  LoginViewController.swift
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
    static let otherLoginViewHeight: CGFloat = 220.0
}

class LoginViewController: YYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initTitleView()
        
        initUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension LoginViewController: YYNavUniversalable {
    
    private func initTitleView() {
        let model = YYNavigationBarAggregation(leftItems: [YYNavigationBarItemMetric.back],
                                               centerItem: nil,
                                               rightItems: [])
        titleView = self.universals(aggregation: model) { (model) in
            let type = model.type
            switch type {
            case .back:
                self.dismiss(animated: true, completion: nil)
            default: break
            }
        }
        titleView?.backgroundColor = .clear
    }
}
extension LoginViewController: YYAccountLoginabel {
    
    func initUI() {
        initGradient()
        
        let logoTitle = initLogoTitle()
        let accountField = initAccountFiled { }
        let passwordField = initPassWordFiled { }
        let (loginBtnView, loginBtn) = initLoginBtnView { (event) in
            log.info(event.title)
            if event.type == .registered {
                let controller = RegisteredViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        loginBtn.isEnabled = false
        
        let otherLoginView = initOtherLoginView { event in
            log.info(event.title)
        }
        
        view.addSubview(logoTitle)
        view.addSubview(accountField)
        view.addSubview(passwordField)
        view.addSubview(loginBtnView)
        view.addSubview(otherLoginView)
        
        logoTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().multipliedBy(0.3)
            make.centerX.equalToSuperview()
        }
        accountField.snp.makeConstraints { (make) in
            make.top.equalTo(logoTitle.snp.bottom).offset(MetricGlobal.margin * 2)
            make.centerX.equalToSuperview()
            if kScreenWidth <= 320 {
                make.left.equalToSuperview().offset(MetricGlobal.margin * 2)
            } else {
                make.left.equalToSuperview().offset(MetricGlobal.margin * 3)
            }
            make.height.equalTo(Metric.fieldHeight)
        }
        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(accountField.snp.bottom).offset(MetricGlobal.margin * 2)
            make.left.equalTo(accountField.snp.left)
            make.right.equalTo(accountField.snp.right)
            make.height.equalTo(Metric.fieldHeight)
        }
        loginBtnView.snp.makeConstraints { (make) in
            make.top.equalTo(passwordField.snp.bottom).offset(MetricGlobal.margin * 3)
            make.left.equalTo(accountField.snp.left)
            make.right.equalTo(accountField.snp.right)
        }
        otherLoginView.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtnView.snp.bottom).offset(MetricGlobal.margin * 2)
            make.left.equalTo(accountField.snp.left)
            make.right.equalTo(accountField.snp.right)
            make.bottom.equalToSuperview()
        }
        
        self.bindMode(accountField: accountField, passwordField: passwordField, loginBtn: loginBtn)
    }
    
    func bindMode(accountField: UITextField, passwordField: UITextField, loginBtn: UIButton) {
        // 创建 视图模型
        let loginViewModel = LoginViewModel(input: (accountField, passwordField, loginBtn), service: LoginService.shareInstance)
        
        loginViewModel.accountUseable.drive(accountField.rx.validationResult).disposed(by: rx.disposeBag)
        loginViewModel.passwordUseable.drive(passwordField.rx.validationResult).disposed(by: rx.disposeBag)
        loginViewModel.loginBtnEnable.drive(onNext: { (beel) in
            loginBtn.isEnabled = beel
        }).disposed(by: rx.disposeBag)
        
        loginViewModel.loginResult.drive(onNext: { (result) in
            switch result {
            case .success(let massage, let model):
                if let model = model as? LoginModel {
                    SwiftMessages.showSuccess(msg: "\(massage)\(model.uid!)")
                }
                self.view.endEditing(true)
                self.dismiss(animated: true, completion: nil)
            case .failed(let massage):
                SwiftMessages.showWarning(msg: massage)
            default:
                break
            }
        }).disposed(by: rx.disposeBag)
    }
}
