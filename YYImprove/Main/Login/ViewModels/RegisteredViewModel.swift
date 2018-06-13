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
    
    func registered(username: String, password: String, email: String) -> Observable<RegisteredModel> {
        return apiManagerProvider.rx.request(ApiManager.rigister(username: username,
                                                                 password: password,
                                                                 email: email))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapJSON()
            .mapObject(type: RegisteredModel.self)
            .showAPIErrorToast()
    }
}
