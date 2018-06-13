//
//  Observable+Extension.swift
//  YYImprove
//
//  Created by YY on 2018/6/12.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import SwiftMessages

extension Observable {
    func showAPIErrorToast() -> Observable<Element> {
        return self.do(onNext: { (event) in
        }, onError: { (error) in
            if let moyaError = error as? MoyaError {
                self.handleMoyaError(error: moyaError)
            }
            if let customError = error as? RxSwiftMoyaError {
                self.handleBusinessError(error: customError)
            }
        }, onCompleted: {
        }, onSubscribe: {
        }, onDispose: {
            log.info("dispose")
        })
    }
    
    // 处理moya异常错误信息
    private func handleMoyaError(error: MoyaError) {
        switch error {
        case .imageMapping:
            SwiftMessages.showError(msg: "图像解析失败")
        case .jsonMapping:
            SwiftMessages.showError(msg: "数据解析失败")
        case .stringMapping:
            SwiftMessages.showError(msg: "字符串解析失败")
        case .objectMapping:
            SwiftMessages.showError(msg: "对象解析失败")
        case .encodableMapping:
            SwiftMessages.showError(msg: "编码失败")
        case .statusCode(let response):
            SwiftMessages.showError(msg: "请求失败\(response.statusCode)")
        case .requestMapping:
            SwiftMessages.showError(msg: "未能成功创建请求")
        case .parameterEncoding:
            SwiftMessages.showError(msg: "参数编码失败")
        case .underlying(let error, _):
            SwiftMessages.showError(msg: error.localizedDescription)
        }
    }
    
    // 处理moya异常错误信息
    private func handleBusinessError(error: RxSwiftMoyaError) {
        switch error {
        case .parseJSONError:
            SwiftMessages.showWarning(msg: "数据解析失败")
        case .loginStateIsexpired:
            SwiftMessages.showWarning(msg: "登录过期,请重新登录")
        case .customException(let messate, _):
            SwiftMessages.showWarning(msg: "\(messate)")
        }
    }
}
