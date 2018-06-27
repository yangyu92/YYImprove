//
//  ViewController.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/4/27.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import SwiftMessages

class ViewController: YYBaseViewController {

    // MARK: - 布局初始化相关
    // MARK: - 类生命周期相关
    // MARK: - Base类方法重写
    // MARK: - 系统的Delegate
    // MARK: - 所有的Actions
    // MARK: - 通知回调，具体可以细分
    // MARK: - 自定义View、初始化等
    // MARK: - 自定义类的Delegate
    // MARK: - 类的Public方法
    // MARK: - 类私有方法
    // MARK: - api调用方法
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTitleView(title: "测试登录页面测试登录页面测试登录页面测试登录页面测试登录页面")
        
        log.verbose("Verbose")
        log.debug("Debug")
        log.info("Info")
        log.warning("Warning")
        log.error("Error")
        log.severe("Severe")
        
        // UserDefault使用
        Defaults[.username] = "你好"
        let username = Defaults[.username]
        log.info(username)
        
//        let viewModel = RegisteredViewModel()
//        viewModel.registered(username: "13397470679",
//                             password: "000000",
//                             email: "yang_yu92@foxmail.com").subscribe(onNext: { (loginModel) in
//                                //                log.info("---\(String(describing: loginModel.retCode!))")
//                                SwiftMessages.showSuccess(msg: "注册成功")
//                             }).disposed(by: self.rx.disposeBag)
    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        title = "设置"
    }
}
