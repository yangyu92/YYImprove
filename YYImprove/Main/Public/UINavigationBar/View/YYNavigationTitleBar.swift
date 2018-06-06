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
        self.backgroundColor = IGNavigationBackgroundColor
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
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(kSCREENWIDTH)
            make.height.equalTo(kNavbarH)
        }
        super.layoutSubviews()
    }
}

extension YYNavigationTitleBar: YYNavUniversalable {
    // MARK: - 初始化 首页 导航栏组件
    func initBackNavigationBar(title: String) {
        
        // 返回按钮
        let backBtn = self.universal(model: YYNavigationBarItemMetric.back) { (model) in
            self.itemClicked!(model)
        }
        self.addSubview(backBtn)
        
        // 返回按钮
        let backBtn1 = self.universal(model: YYNavigationBarItemMetric.back) { (model) in
            self.itemClicked!(model)
        }
        self.addSubview(backBtn1)
        
        let titleItem = YYNavigationBarItemModel(type: .title,
                                                 position: .center,
                                                 title: title,
                                                 description: "标题")
        let titleBtn = self.universal(model: titleItem) { (model) in
            self.itemClicked!(model)
        }
        self.addSubview(titleBtn)
        backBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-Metric.itemBottom)
            make.left.equalTo(MetricGlobal.padding)
            make.width.height.equalTo(Metric.itemSize)
            make.right.lessThanOrEqualTo(titleBtn.snp.left).priority(500)
        }
        
        titleBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(kNavTitleH)
        }
        
        backBtn.setContentCompressionResistancePriority(UILayoutPriority.required, for: UILayoutConstraintAxis.horizontal)
        
        // 内容紧凑 - 优先完全显示内容，且不多占像素。
//        backBtn.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: UILayoutConstraintAxis.horizontal)
        titleBtn.setContentHuggingPriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
        
        // 抵抗 压缩，抗压缩低的，在上一步的基础上，进行压缩调整。
//        backBtn.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: UILayoutConstraintAxis.horizontal)
        titleBtn.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
    }
}
