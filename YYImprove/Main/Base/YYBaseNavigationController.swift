//
//  YYBaseNavigationController.swift
//  YYImprove
//
//  Created by canyou on 2018/4/29.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit

class YYBaseNavigationController: UINavigationController, UINavigationControllerDelegate {

    weak var popDelegate: UIGestureRecognizerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
        
        //去导航下边线
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        // 是否透明
        self.navigationBar.isTranslucent = false
        
        // 标题样式
        let bar = UINavigationBar.appearance()
        bar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                   NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0)]
        // 设置返回按钮的样式
        self.navigationBar.tintColor = IGNavigationTitleColor
        // 设置返回标识器的颜色
        self.navigationBar.barTintColor = IGNavigationBackgroundColor
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: IGNavigationTitleColor]
        
        let barItem = UIBarButtonItem.appearance()
        barItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: IGNavigationTitleColor],
                                       for: .normal)  // 返回按钮文字样式
        
//        self.navigationBar.isHidden = true
        
        log.info("Navigation-init: \(type(of: self))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        log.info("Navigation-deinit: \(type(of: self))")
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //清空滑动返回手势的代理就能实现
        if viewController == self.viewControllers[0] {
            self.interactivePopGestureRecognizer!.delegate = self.popDelegate
        } else {
            self.interactivePopGestureRecognizer!.delegate = nil
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            let backButton = UIBarButtonItem()
//            backButton.title = L10n.back
            viewControllers.last?.navigationItem.backBarButtonItem = backButton
        }
        super.pushViewController(viewController, animated: animated)
    }
}

// MARK: - 事件 (部分页面失效)
extension YYBaseViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        // 注销 键盘
        view.endEditing(true)
    }
}
