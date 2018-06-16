//
//  HCAccountLoginResult.swift
//  RxXMLY
//
//  Created by sessionCh on 2018/1/3.
//  Copyright © 2018年 sessionCh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum HCAccountLoginResult {
    case success(message:String)
    case empty
    case failed(message:String)
}

extension HCAccountLoginResult {
    var description: String {
        switch self {
        case let .success(message):
            return message
        case .empty:
            return ""
        case let .failed(message):
            return message
        }
    }
}

extension HCAccountLoginResult {
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
    
    var validationResult: Binder<HCAccountLoginResult> {
        return Binder(self.base) { field, result in
            field.layer.borderColor = result.borderColor
        }
    }
}
