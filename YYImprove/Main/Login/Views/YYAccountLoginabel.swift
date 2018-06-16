//
//  YYAccountLoginabel.swift
//  YYImprove
//
//  Created by YY on 2018/6/15.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

private struct Metric {
    
    static let tipBtnWidth: CGFloat = 40.0
    static let borderWidth: CGFloat = 1.0
    static let cornerRadius: CGFloat = 5.0
    
    static let fontSize = UIFont.systemFont(ofSize: 16)
    
    static let loginBtnHeight: CGFloat = 50.0
    static let loginBtnFontSize = UIFont.systemFont(ofSize: 18)
    static let forgetFontSize = UIFont.systemFont(ofSize: 15)
    static let loginBtnTitle = "登 录"
    static let forgetBtnTitle = "忘记密码？"
    static let registeredTitle = "注 册"
    static let accountPlaceholder = "请输入手机号"
    static let passswordPlaceholder = "请输入密码"
}

protocol YYAccountLoginabel {
    
}

extension YYAccountLoginabel where Self: LoginViewController {
    
    func initAccountFiled(onNext: () -> Void) -> UITextField {
        let field = UITextField().then {
            $0.layer.masksToBounds = true
            $0.layer.borderColor = kThemeWhiteColor.alpha(0.5).cgColor
            $0.layer.borderWidth = Metric.borderWidth
            $0.layer.cornerRadius = Metric.cornerRadius
            $0.borderStyle = .none
            $0.keyboardType = .asciiCapableNumberPad
            $0.tintColor = kThemeWhiteColor
            $0.textColor = kThemeWhiteColor
            $0.clearButtonMode = .whileEditing
            $0.leftViewMode = .always
            $0.leftView = self.accountLetfView()
            $0.placeholder = Metric.accountPlaceholder
            #if DEBUG
            $0.text = "13397470679"
            #endif
        }
        return field
    }
    
    private func accountLetfView() -> UIView {
        let leftView = UIView().then {
            $0.frame = CGRect(x: 0, y: 0, width: 40, height: 44)
        }
        let tipBtn = UIButton().then {
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = false
            $0.setImage(UIImage(asset: Asset.Login.loginAccountW), for: .normal)
        }
        leftView.addSubview(tipBtn)
        tipBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(Metric.tipBtnWidth)
        }
        return leftView
    }
    
    func initPassWordFiled(onNext: () -> Void) -> UITextField {
        let field = UITextField().then {
            $0.layer.masksToBounds = true
            $0.layer.borderColor = kThemeWhiteColor.alpha(0.5).cgColor
            $0.layer.borderWidth = Metric.borderWidth
            $0.layer.cornerRadius = Metric.cornerRadius
            $0.borderStyle = .none
            $0.tintColor = kThemeWhiteColor
            $0.textColor = kThemeWhiteColor
            $0.clearButtonMode = .whileEditing
            $0.keyboardType = .asciiCapable
            $0.isSecureTextEntry = true
            $0.leftViewMode = .always
            $0.leftView = self.passwordLeftView()
            $0.placeholder = Metric.passswordPlaceholder
            $0.rightViewMode = .always
            #if DEBUG
            $0.text = "000000"
            #endif
        }
        let rightView = self.passwordRightView { (btn) in
            field.isSecureTextEntry = !btn.isSelected
            let text = field.text
            field.text = ""
            field.text = text
        }
        field.rightView = rightView
        return field
    }
    
    private func passwordLeftView() -> UIView {
        let leftView = UIView().then {
            $0.frame = CGRect(x: 0, y: 0, width: 40, height: 44)
        }
        let tipBtn = UIButton().then {
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = false
            $0.setImage(UIImage(asset: Asset.Login.loginPasswordW), for: .normal)
        }
        leftView.addSubview(tipBtn)
        tipBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(Metric.tipBtnWidth)
        }
        return leftView
    }
    
    private func passwordRightView(onNext: @escaping (_ button: UIButton) -> Void) -> UIView {
        let rightView = UIView().then {
            $0.frame = CGRect(x: 0, y: 0, width: 40, height: 44)
        }
        let tipBtn = UIButton().then {
            $0.contentMode = .scaleAspectFit
            $0.setImage(UIImage(asset: Asset.Login.loginInvisibleW), for: .normal)
            $0.setImage(UIImage(asset: Asset.Login.loginVisibleW), for: .selected)
        }
        rightView.addSubview(tipBtn)
        tipBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(Metric.tipBtnWidth)
        }
        tipBtn.rx.tap.subscribe({event in
            tipBtn.isSelected = !tipBtn.isSelected
            onNext(tipBtn)
        }).disposed(by: rx.disposeBag)
        
        return rightView
    }
    
    func initLogoTitle() -> UILabel {
        let logoTitle = UILabel().then {
            //        $0.font = UIFont(name: "PartyLetPlain", size: 45)
            $0.font = UIFont(name: "SavoyeLetPlain", size: 60)
            //        $0.font = UIFont(name: "Zapfino", size: 35)
            $0.textAlignment = .center
            $0.text = "Improve"
            $0.textColor = UIColor.white
        }
        return logoTitle
    }
    
    func initLoginBtnView(onNext: @escaping (_ event: AccountLoginEvent) -> Void) -> (UIView, UIButton) {
        let view = UIView().then {
            $0.backgroundColor = .clear
        }
        let loginBtn = self.createLoginBtn()
        loginBtn.rx.tap.do(onNext: {
            onNext(AccountLoginEvent.init(type: .login, title: "登陆按钮"))
        }).subscribe().disposed(by: rx.disposeBag)
        let registeredBtn = UIButton().then {
            $0.setTitleColor(kThemeWhiteColor, for: .normal)
            $0.setTitleColor(kThemeWhiteColor.alpha(0.6), for: .highlighted)
            $0.setTitle(Metric.registeredTitle, for: .normal)
            $0.titleLabel?.font = Metric.forgetFontSize
            $0.rx.tap.do(onNext: {
                onNext(AccountLoginEvent.init(type: .registered, title: "注册"))
            }).subscribe().disposed(by: rx.disposeBag)
        }
        let forgetBtn = UIButton().then {
            $0.setTitleColor(kThemeWhiteColor, for: .normal)
            $0.setTitleColor(kThemeWhiteColor.alpha(0.6), for: .highlighted)
            $0.setTitle(Metric.forgetBtnTitle, for: .normal)
            $0.titleLabel?.font = Metric.forgetFontSize
            $0.rx.tap.do(onNext: {
                onNext(AccountLoginEvent.init(type: .forget, title: "忘记密码"))
                loginBtn.isEnabled = !loginBtn.isEnabled
            }).subscribe().disposed(by: rx.disposeBag)
        }
        view.addSubview(loginBtn)
        view.addSubview(registeredBtn)
        view.addSubview(forgetBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(Metric.loginBtnHeight)
        }
        registeredBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(MetricGlobal.margin)
            make.left.equalTo(loginBtn.snp.left).offset(MetricGlobal.margin)
            make.height.equalTo(35)
            make.bottom.equalToSuperview().offset(-MetricGlobal.margin)
        }
        forgetBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(MetricGlobal.margin)
            make.right.equalTo(loginBtn.snp.right)
            make.height.equalTo(35)
            make.bottom.equalTo(registeredBtn.snp.bottom)
        }
        return (view, loginBtn)
    }
    
    private func createLoginBtn() -> UIButton {
        let bgSize = CGSize(width: 1, height: 1)
        let loginBtn = UIButton().then {
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = Metric.loginBtnHeight / 2
            $0.titleLabel?.font = Metric.loginBtnFontSize
            $0.setTitleColor(kThemeWhiteColor, for: .normal)
            $0.setTitleColor(kThemeWhiteColor.alpha(0.6), for: .disabled)
            $0.setTitleColor(kThemeWhiteColor.alpha(0.8), for: .highlighted)
            $0.setBackgroundImage(UIImage(color: kThemeWhiteColor.alpha(0.5), size: bgSize), for: .normal)
            $0.setBackgroundImage(UIImage(color: kThemeWhiteColor.alpha(0.2), size: bgSize), for: .disabled)
            $0.setBackgroundImage(UIImage(color: kThemeWhiteColor.alpha(0.3), size: bgSize), for: .highlighted)
            $0.setTitle(Metric.loginBtnTitle, for: .normal)
        }
        return loginBtn
    }
}
