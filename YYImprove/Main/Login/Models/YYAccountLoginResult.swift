//
//  YYAccountLoginResult.swift
//  YYImprove
//
//  Created by YY on 2018/6/19.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum YYAccountLoginResult {
    case success(message:String, data: Any?)
    case empty
    case failed(message:String)
}

extension YYAccountLoginResult {
    var description: String {
        switch self {
        case let .success(message, _):
            return message
        case .empty:
            return ""
        case let .failed(message):
            return message
        }
    }
}

extension YYAccountLoginResult {
    var borderColor: CGColor {
        switch self {
        case .success:
            return kThemeWhiteColor.alpha(0.5).cgColor
        case .empty:
            return kThemeOrangeRedColor.alpha(0.5).cgColor
        case .failed:
            return UIColor.red.alpha(0.5).cgColor
        }
    }
}

extension Reactive where Base: UITextField {
    
    var validationResult: Binder<YYAccountLoginResult> {
        return Binder(self.base) { field, result in
            field.layer.borderColor = result.borderColor
        }
    }
}
