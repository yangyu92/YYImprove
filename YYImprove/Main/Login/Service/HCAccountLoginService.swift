//
//  HCAccountLoginService.swift
//  RxXMLY
//
//  Created by sessionCh on 2018/1/3.
//  Copyright © 2018年 sessionCh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HCAccountLoginService {

    static let shareInstance = HCAccountLoginService()
    private init() {}

    // 验证账号是否合法
    func validationAccount(_ account: String) -> Observable<HCAccountLoginResult> {
        
        if HCInputValidator.isValidEmail(email: account) == false {
            return Observable.just(HCAccountLoginResult.failed(message: "账号非法"))
        }
      
        return Observable.just(HCAccountLoginResult.success(message: "账号合法"))
    }
    
    // 验证密码是否合法
    func validationPassword(_ passsword: String) -> Observable<HCAccountLoginResult> {
        
        if HCInputValidator.isvalidationPassword(password: passsword) == false {
            return Observable.just(HCAccountLoginResult.failed(message: "密码非法"))
        }
        
        return Observable.just(HCAccountLoginResult.success(message: "密码合法"))
    }
        
    // 登录请求
    func login(account: String, password: String) -> Observable<HCAccountLoginResult> {
        
        if account.count > 10 {
            return Observable.just(HCAccountLoginResult.success(message: "登录成功"))
        } else {
            return Observable.just(HCAccountLoginResult.failed(message: "密码错误"))
        }
    }
    
    // 登录按钮是否可用
    func loginBtnEnable(account: String, password: String) -> Observable<Bool> {
        
        if HCInputValidator.isValidEmail(email: account) && HCInputValidator.isvalidationPassword(password: password) {
            return Observable.just(true)
        } else {
            return Observable.just(false)
        }
    }
}
