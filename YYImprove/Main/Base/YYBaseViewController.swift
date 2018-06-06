//
//  YYBaseViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/6/2.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit

class YYBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = kThemeWhiteColor

        automaticallyAdjustsScrollViewInsets = false
        
//        log.info("init:\(type(of: self))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
//        log.info("deinit: \(type(of: self))")
    }
}

// MARK: - 初始化协议
extension YYBaseViewController: YYNavBackable {

    // MARK: - 标题组件
    func initTitleView(title: String) -> UIView {
        let homeNavigationBar = YYNavigationTitleBar(title)
        
        homeNavigationBar.itemClicked = { [weak self] (model) in
            guard let `self` = self else { return }
            let type = model.type
            switch type {
            case .back:
                self.navigationController?.popViewController(animated: true)
            default:
                break
            }
        }
        return self.navigationBackView(titleView: homeNavigationBar)
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
