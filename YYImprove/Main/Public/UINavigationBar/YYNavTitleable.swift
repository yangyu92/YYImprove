//
//  YYNavTitleable.swift
//  YYImprove
//
//  Created by canyou on 2018/6/5.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit

protocol YYNavTitleable {
    
}

extension YYNavTitleable where Self: UIViewController {
    
    // MARK: - 导航栏 自定义标题 通用组件
    func titleView(titleView: UIView) -> UIView {
        self.view.addSubview(titleView)
        self.view.bringSubview(toFront: titleView)
        return titleView
    }
}
