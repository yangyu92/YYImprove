//
//  YYBaseViewController.swift
//  YYImprove
//
//  Created by YY on 2018/6/2.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

class YYBaseViewController: UIViewController {

    var titleView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = kThemeWhiteColor

        // 由于默认隐藏系统导航,让布局从初始化位置开始(不可更改)
        automaticallyAdjustsScrollViewInsets = false
        
//        log.info("init:\(type(of: self))")
    }
    
    override func viewWillLayoutSubviews() {
        if let titleView = titleView {
            self.view.bringSubview(toFront: titleView)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
//        log.info("deinit: \(type(of: self))")
    }
}

// MARK: - 通用的导航协议(显示带返回按钮导航)
extension YYBaseViewController: YYNavBackable {
    
    @discardableResult
    func initTitleView(title: String) -> UIView {
        let navigationTitleBar = YYNavigationTitleBar(title)
        navigationTitleBar.itemClicked = { [weak self] (model) in
            guard let `self` = self else { return }
            let type = model.type
            switch type {
            case .back:
                self.navigationController?.popViewController(animated: true)
            default:
                break
            }
        }
        return self.navigationBackView(titleView: navigationTitleBar)
    }
}
extension YYBaseViewController {
    /// 用户解决兼容问题
    func compatibility () {
        if #available(iOS 11.0, *) {
//            tableView.estimatedRowHeight = 0.0
//            tableView.estimatedSectionFooterHeight = 0.0
//            tableView.estimatedSectionHeaderHeight = 0.0
        }
    }
}

// MARK: - 事件 (部分页面失效)
extension YYBaseNavigationController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        // 注销 键盘
        view.endEditing(true)
    }
}
