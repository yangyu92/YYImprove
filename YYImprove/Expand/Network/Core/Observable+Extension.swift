//
//  Observable+Extension.swift
//  YYImprove
//
//  Created by YY on 2018/6/12.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import Foundation
import RxSwift
import SwiftMessages

extension Observable {
    func showAPIErrorToast() -> Observable<Element> {
        return self.do(onNext: { (event) in
        }, onError: { (error) in
            SwiftMessages.showError(msg: error.localizedDescription)
        }, onCompleted: {
        }, onSubscribe: {
        }, onDispose: {
        })
    }
}
