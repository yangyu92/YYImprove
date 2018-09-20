//
//  YYArticleNavigationBar.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/6/6.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

class YYMeNavigationBar: UIView {
    
    typealias AddBlock = (_ model: YYNavigationBarItemModel) -> Void
    var itemClicked: AddBlock? = { (_) in
        return
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        initArticleNavigationBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        // 添加约束
        self.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(MetricGlobal.kNavigationTabbarHight)
        }
        super.layoutSubviews()
    }
}

extension YYMeNavigationBar: YYNavUniversalable {
    // MARK: - 初始化 首页 导航栏组件
    func initArticleNavigationBar() {
        
        // 创建组件
        let view = UIView().then {
            $0.backgroundColor = .clear
            self.addSubview($0)
            $0.snp.makeConstraints({ (make) in
                make.left.right.equalToSuperview()
                make.bottom.equalToSuperview()
                make.height.equalTo(MetricGlobal.kNavigationTitleHight)
            })
        }
        
        // 返回按钮
        let message = self.universal(model: YYNavigationBarItemMetric.message) { (model) in
            self.itemClicked!(model)
        }
        view.addSubview(message)
        let search = self.universal(model: YYNavigationBarItemMetric.setting) { (model) in
            self.itemClicked!(model)
        }
        view.addSubview(search)
        
        let titleItem = YYNavigationBarItemModel(type: .title,
                                                 position: .center,
                                                 title: "我的",
                                                 barItemDescription: "标题")
        let titleBtn = self.universal(model: titleItem) { (model) in
            self.itemClicked!(model)
        }
        view.addSubview(titleBtn)
        
        message.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(MetricGlobal.margin)
            make.right.lessThanOrEqualTo(titleBtn.snp.left).priority(.high)
            make.width.equalTo(MetricGlobal.navigationItemSize)
            make.height.equalToSuperview()
        }
        search.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-MetricGlobal.margin)
            make.width.equalTo(MetricGlobal.navigationItemSize)
            make.height.equalToSuperview()
            make.left.greaterThanOrEqualTo(titleBtn.snp.right).priority(.high)
        }
        titleBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(MetricGlobal.kNavigationTitleHight)
        }
        
        /// Title文本过长时,隐藏超出部分
        titleBtn.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        titleBtn.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
    }
}
