//
//  LoginViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/24.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import SwiftMessages

class LoginViewController: YYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "登录"
        
        initTitleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension LoginViewController: YYNavUniversalable {
    
    private func initTitleView() {
        let model = YYNavigationBarAggregation(leftItems: [YYNavigationBarItemMetric.back],
                                               centerItem: YYNavigationBarItemMetric.loginTitle,
                                               rightItems: [YYNavigationBarItemMetric.loginRegister])
        titleView = self.universals(aggregation: model) { (model) in
            let type = model.type
            switch type {
            case .back:
                self.dismiss(animated: true, completion: nil)
            case .loginRegister:
                let controller = RegisteredViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            default: break
            }
        }
    }
}
