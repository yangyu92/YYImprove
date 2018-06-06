//
//  LoginViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/24.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit

class LoginViewController: YYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "登录"
        
//        initEnableMudule()
        _ = initTitleView(title: "登录")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//// MARK: - 初始化协议
//extension LoginViewController: HCNavUniversalable {
//    
//    // MARK: - 协议组件
//    private func initEnableMudule() {
//        
//        // 登录页面 返回、注册
//        let models = [HCNavigationBarItemMetric.back,
//                      HCNavigationBarItemMetric.loginRegister]
//        self.universals(modelArr: models) { [weak self] (model) in
//            guard let `self` = self else { return }
//                log.info(model.description)
//            let type = model.type
//            switch type {
//            case .back:
//                self.navigationController?.dismiss(animated: true, completion: nil)
//            default: break
//            }
//        }
//    }
//}
