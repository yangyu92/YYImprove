//
//  ViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/4/27.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class ViewController: UIViewController {

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
        log.verbose("Verbose")
        log.debug("Debug")
        log.info("Info")
        log.warning("Warning")
        log.error("Error")
        log.severe("Severe")
        self.view.backgroundColor = UIColor(hex: "#ffffff")
        super.viewDidLoad()
        
        // UserDefault使用
        Defaults[.username] = "你好"
        let username = Defaults[.username]
        log.info(String(format: "%@", username!))
        
        Defaults[.launchCount] += 1
        let launchCount = Defaults[.launchCount]
        log.info(launchCount)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
