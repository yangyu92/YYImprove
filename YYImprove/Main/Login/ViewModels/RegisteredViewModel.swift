//
//  RegisteredViewModel.swift
//  YYImprove
//
//  Created by YY on 2018/6/12.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class RegisteredViewModel {
    
    func registered(username: String, password: String, email: String) -> Observable<RegisteredModel> {
        
        let target = MultiTarget(ApiUser.rigister(username: username, password: password, email: email))
        let provider = ApiManager.provider(showLoding: true).rx.request(target)
        return provider
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapJSON()
            .mapObject(type: RegisteredModel.self)
            .showAPIErrorToast()
    }
}
