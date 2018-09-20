//
//  YYHomeSearchBarable.swift
//  YYImprove
//  自定义的收银搜索框控件
//  Created by YY on 2018/6/6.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import NSObject_Rx
import Then
import SnapKit

// MARK: - 常量
private struct Metric {
    static let title: String = "养生 | 健身 | 艾灸 | 国家宝藏 | 72小时情感急症室"
    static let fontSize: CGFloat = 13.0
    static let iconWidth: CGFloat = 30.0
    static let searchBarHeight: CGFloat = 30.0
}

protocol YYHomeSearchBarable {
    
}

extension YYHomeSearchBarable where Self: UIView {
    
    // MARK: - 自定义主界面搜索组件
    func searchBar(model: YYNavigationBarItemModel, onNext: @escaping (_ model: YYNavigationBarItemModel) -> Void) -> UIView {
        // 创建组件
        let view = UIView().then {
            $0.backgroundColor = .clear
        }
        let backView = UIView().then {
            $0.backgroundColor = kNavigationTitleColor.alpha(0.6)
            $0.layer.cornerRadius = Metric.searchBarHeight / 2
            // 处理点击事件
            $0.rx.tapGesture().when(.recognized)
                .subscribe({ _ in
                    onNext(model)
                }).disposed(by: rx.disposeBag)
        }
        let icon = UIImageView().then {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(asset: Asset.Navication.navSearchSmallW)
        }
        let lab = UILabel().then {
            $0.textColor = UIColor.gray.alpha(0.5)
            $0.font = UIFont.systemFont(ofSize: Metric.fontSize)
            $0.text = Metric.title
            $0.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
            $0.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        }
        // 添加组件
        backView.addSubview(icon)
        backView.addSubview(lab)
        view.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(MetricGlobal.padding)
            make.height.equalTo(Metric.searchBarHeight)
        }
        icon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.width.equalTo(Metric.iconWidth)
            make.left.equalToSuperview()
        }
        lab.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp.right)
            make.centerY.equalTo(icon)
            make.right.lessThanOrEqualToSuperview().offset(-MetricGlobal.margin)
        }
        return view
    }
}
