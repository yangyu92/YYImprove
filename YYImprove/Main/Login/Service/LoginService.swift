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

class LoginService: NSObject {
    
    static let shareInstance = LoginService()
    override init() {}
    
    // 验证账号是否合法
    func validationAccount(_ account: String) -> Observable<YYAccountLoginResult> {
        
        if account.count == 0 { // 当字符串为空的时候，什么也不做
            return Observable.just(YYAccountLoginResult.empty)
        }
        if !HCInputValidator.isValidPhone(phone: account) {
            return Observable.just(YYAccountLoginResult.failed(message: "账号非法"))
        }
        return Observable.just(YYAccountLoginResult.success(message: "账号合法", data: nil))
    }
    
    // 验证密码是否合法
    func validationPassword(_ password: String) -> Observable<YYAccountLoginResult> {
        if password.count == 0 { // 当字符串为空的时候，什么也不做
            return Observable.just(YYAccountLoginResult.empty)
        }
        if !HCInputValidator.isvalidationPassword(password: password) {
            return Observable.just(YYAccountLoginResult.failed(message: "密码非法"))
        }
        
        return Observable.just(YYAccountLoginResult.success(message: "密码合法", data: nil))
    }
    
    // 登录请求
    func login(account: String, password: String) -> Driver<YYAccountLoginResult> {
        let target = MultiTarget(ApiUser.login(phone: account, password: password))
        let provider = ApiManager.provider(.loding)
        
        let vmDatas = BehaviorRelay<LoginModel?>(value: nil)
        
        provider.rx.request(target)
            .asObservable()
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapObject(type: LoginModel.self)
            .showAPIErrorToast()
            .subscribe(onNext: { (model) in
                vmDatas.accept(model)
            }).disposed(by: self.rx.disposeBag)
        
        return vmDatas.asObservable().map({ (model) -> YYAccountLoginResult in
            return YYAccountLoginResult.success(message: "登录成功", data: model)
        }).asDriver(onErrorJustReturn: .empty)
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
