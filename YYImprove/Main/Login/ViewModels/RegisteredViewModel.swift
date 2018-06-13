//
//  RegisteredViewModel.swift
//  YYImprove
//
//  Created by YY on 2018/6/12.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import Foundation
import RxSwift

class RegisteredViewModel {
    
    func login(username: String, pwd: String) -> Observable<LoginModel> {
        return apiManagerProvider.rx.request(ApiManager.rigister(username: username, password: pwd, email: "yang_yu92@foxmail.com"))
            .filterSuccessfulStatusCodes()
            .asObservable()
//            .mapJSON()
            .mapObject(type: LoginModel.self)
            .showAPIErrorToast()
    }
}
