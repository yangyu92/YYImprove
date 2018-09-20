//
//  YYNavTitleable.swift
//  YYImprove
//  将自定义导航View添加到导航位置
//  Created by yuyangstudio on 2018/6/5.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

protocol YYNavTitleable {
    
}

extension YYNavTitleable where Self: UIViewController {
    // MARK: - 导航栏 自定义标题 通用组件
    func titleView(titleView: UIView) -> UIView {
        self.view.addSubview(titleView)
        self.view.bringSubviewToFront(titleView)
        return titleView
    }
}
