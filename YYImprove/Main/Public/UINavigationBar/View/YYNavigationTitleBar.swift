//
//  YYNavigationTitleBar.swift
//  YYImprove
//  带返回按钮与Title的布局(在BaseViewController中方便调用)
//  Created by YY on 2018/6/5.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

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
        self.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(MetricGlobal.kNavigationTabbarHight)
        }
        super.layoutSubviews()
    }
}

extension YYNavigationTitleBar: YYNavUniversalable {
    func initBackNavigationBar(title: String) {
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
        let titleBtn = self.universal(model: YYNavigationBarItemMetric.title) { (model) in
            self.itemClicked!(model)
        }
        titleBtn.setTitle(title, for: UIControlState.normal)
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
            make.height.equalToSuperview()
        }
        /// Title文本过长时,隐藏超出部分
        titleBtn.setContentHuggingPriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
        titleBtn.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
        
//        // 内容紧凑 - 优先完全显示内容，且不多占像素。
//        backBtn.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: UILayoutConstraintAxis.horizontal)
//        titleBtn.setContentHuggingPriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
//        // 抵抗 压缩，抗压缩低的，在上一步的基础上，进行压缩调整。
//        backBtn.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: UILayoutConstraintAxis.horizontal)
//        titleBtn.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
    }
}
