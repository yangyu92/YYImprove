//
//  LoginService.swift
//  YYImprove
//
//  Created by YY on 2018/6/16.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import Moya

class LoginService {
    
    static let shareInstance = LoginService()
    private init() {}
    
    // 验证账号是否合法
    func validationAccount(_ account: String) -> Observable<HCAccountLoginResult> {
        
        if account.count == 0 { // 当字符串为空的时候，什么也不做
            return Observable.just(HCAccountLoginResult.empty)
        }
        if !HCInputValidator.isValidPhone(phone: account) {
            return Observable.just(HCAccountLoginResult.failed(message: "账号非法"))
        }
        return Observable.just(HCAccountLoginResult.success(message: "账号合法"))
    }
    
    // 验证密码是否合法
    func validationPassword(_ passsword: String) -> Observable<HCAccountLoginResult> {
        if passsword.count == 0 { // 当字符串为空的时候，什么也不做
            return Observable.just(HCAccountLoginResult.empty)
        }
        if !HCInputValidator.isvalidationPassword(password: passsword) {
            return Observable.just(HCAccountLoginResult.failed(message: "密码非法"))
        }
        
        return Observable.just(HCAccountLoginResult.success(message: "密码合法"))
    }
    
    // 登录请求
    func login(account: String, password: String) -> Observable<HCAccountLoginResult> {
//        let target = MultiTarget(ApiUser.rigister(username: account, password: password, email: "yang_yu92@foxmail.com"))
//        let provider = ApiManager.provider(showLoding: true).rx.request(target)
//        return provider
//            .filterSuccessfulStatusCodes()
//            .asObservable()
//            .mapJSON()
//            .mapObject(type: RegisteredModel.self)
//            .showAPIErrorToast().map({ (model) -> HCAccountLoginResult in
//                return HCAccountLoginResult.success(message: "登录成功")
//            })
        
        let target = MultiTarget(ApiUser.login(phone: account, password: password))
        let provider = ApiManager.provider(showLoding: true).rx.request(target)
        return provider
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapJSON()
            .mapObject(type: LoginModel.self)
            .showAPIErrorToast().map({ (model) -> HCAccountLoginResult in
                return HCAccountLoginResult.success(message: "登录成功")
            })
    }
    
    // 登录按钮是否可用
    func loginBtnEnable(account: String, password: String) -> Observable<Bool> {
        
        if HCInputValidator.isValidPhone(phone: account)
            && HCInputValidator.isvalidationPassword(password: password) {
            return Observable.just(true)
        } else {
            return Observable.just(false)
        }
    }
}
