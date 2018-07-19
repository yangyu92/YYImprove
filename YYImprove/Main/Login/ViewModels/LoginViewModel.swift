//
//  LoginViewModel.swift
//  YYImprove
//
//  Created by YY on 2018/6/16.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel {
    
    let accountUseable: Driver<YYAccountLoginResult>
    let passwordUseable: Driver<YYAccountLoginResult>
    let loginBtnEnable: Driver<Bool>
    let loginResult: Driver<YYAccountLoginResult>
    
    init(input:
        (accountField: UITextField, passwordField: UITextField, loginBtn: UIButton),
         service: LoginService) {
        
        let accountDriver = input.accountField.rx.text.orEmpty.asDriver()
        
        let passwordDriver = input.passwordField.rx.text.orEmpty.asDriver()
        let loginTapDriver = input.loginBtn.rx.tap.asDriver()
        
        accountUseable = accountDriver.skip(1).flatMapLatest { account in
            return service.validationAccount(account).asDriver(onErrorJustReturn: .failed(message: "连接service失败"))
        }

        passwordUseable = passwordDriver.skip(1).flatMapLatest { password in
            return service.validationPassword(password).asDriver(onErrorJustReturn: .failed(message: "连接service失败"))
        }

        let accountAndPassword = Driver.combineLatest(accountDriver, passwordDriver) {
            return ($0, $1)
        }

        loginBtnEnable = accountAndPassword.flatMap { (account, password) in
            return service.loginBtnEnable(account: account, password: password).asDriver(onErrorJustReturn: false)
        }
        
        loginResult = loginTapDriver.withLatestFrom(accountAndPassword).flatMap { (account, password) in
            return service.login(account: account, password: password)
        }
    }
}
