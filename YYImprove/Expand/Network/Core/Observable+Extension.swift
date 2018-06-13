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
            log.info("event In")
        }, onError: { (error) in
            
            log.info("error")
            SwiftMessages.showError(msg: error.localizedDescription)
        }, onCompleted: {
            log.info("completed")
        }, onSubscribe: {
            log.info("subscribe")
        }, onDispose: {
            log.info("dispose")
        })
        
    }
}
