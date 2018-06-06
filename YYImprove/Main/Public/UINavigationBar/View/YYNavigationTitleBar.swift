//
//  YYNavigationTitleBar.swift
//  YYImprove
//
//  Created by canyou on 2018/6/5.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit

// MARK: - 常量
private struct Metric {
    static let itemSize: CGFloat = 30.0
    static let itemBottom: CGFloat = 7.0
}

class YYNavigationTitleBar: UIView {
    
    typealias AddBlock = (_ model: YYNavigationBarItemModel) -> Void
    var itemClicked: AddBlock? = { (_) in
        return
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = kNavigationBackgroundColor
    }
    
    init(_ title: String) {
        self.init()
        initBackNavigationBar(title: title)
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

extension YYNavigationTitleBar: YYNavUniversalable {
    // MARK: - 初始化 首页 导航栏组件
    func initBackNavigationBar(title: String) {
        
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
        let backBtn = self.universal(model: YYNavigationBarItemMetric.back) { (model) in
            self.itemClicked!(model)
        }
        view.addSubview(backBtn)
        
        let titleItem = YYNavigationBarItemModel(type: .title,
                                                 position: .center,
                                                 title: title,
                                                 description: "标题")
        let titleBtn = self.universal(model: titleItem) { (model) in
            self.itemClicked!(model)
        }
        view.addSubview(titleBtn)
        backBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(MetricGlobal.padding)
            make.right.lessThanOrEqualTo(titleBtn.snp.left).priority(.high)
            make.width.equalTo(MetricGlobal.navigationItemSize)
            make.height.equalToSuperview()
        }
        titleBtn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(MetricGlobal.kNavigationTitleHight)
        }
        
        /// Title文本过长时,隐藏超出部分
        titleBtn.setContentHuggingPriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
        titleBtn.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)

//        // 内容紧凑 - 优先完全显示内容，且不多占像素。
//        backBtn.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: UILayoutConstraintAxis.horizontal)
//        titleBtn.setContentHuggingPriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
//        
//        // 抵抗 压缩，抗压缩低的，在上一步的基础上，进行压缩调整。
//        backBtn.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: UILayoutConstraintAxis.horizontal)
//        titleBtn.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
    }
}
