//
//  HCHomeNavigationBar.swift
//  RxXMLY
//
//  Created by sessionCh on 2017/12/16.
//  Copyright © 2017年 sessionCh. All rights reserved.
//

import UIKit

class YYHomeNavigationBar: UIView {
    
    typealias AddBlock = (_ model: YYNavigationBarItemModel) -> Void
    var itemClicked: AddBlock? = { (_) in
        return
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = kNavigationBackgroundColor
        initHomeNavigationBar()
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

extension YYHomeNavigationBar: YYNavUniversalable, YYHomeSearchBarable {
    // MARK: - 初始化 首页 导航栏组件
    func initHomeNavigationBar() {
        
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
        let message = self.universal(model: YYNavigationBarItemMetric.message) { (model) in
            self.itemClicked!(model)
        }
        view.addSubview(message)
        let history = self.universal(model: YYNavigationBarItemMetric.history) { (model) in
            self.itemClicked!(model)
        }
        view.addSubview(history)
        let download = self.universal(model: YYNavigationBarItemMetric.download) { (model) in
            self.itemClicked!(model)
        }
        view.addSubview(download)
        // 搜索栏
        let searchBar = self.searchBar(model: YYNavigationBarItemMetric.homeSearchBar) { (model) in
            self.itemClicked!(model)
        }
        view.addSubview(searchBar)
        
        message.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(MetricGlobal.padding)
            make.right.lessThanOrEqualTo(searchBar.snp.left).priority(.high)
            make.width.equalTo(MetricGlobal.navigationItemSize)
            make.height.equalToSuperview()
        }
        download.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-MetricGlobal.padding)
            make.width.equalTo(MetricGlobal.navigationItemSize)
            make.height.equalToSuperview()
        }
        history.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(download.snp.left)
            make.width.equalTo(MetricGlobal.navigationItemSize)
            make.height.equalToSuperview()
            make.left.greaterThanOrEqualTo(searchBar.snp.right).priority(.high)
        }
        searchBar.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
        }
        /// 中间可缩放视图进行设置
        searchBar.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        searchBar.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
    }
}
