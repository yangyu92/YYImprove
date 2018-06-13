//
//  YYNavUniversalable.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/6/5.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

// MARK: - 导航栏 通用组件
struct YYNavigationBarItemMetric {
    
    // Left
    static let back = YYNavigationBarItemModel(type: .back,
                                               position: .left,
                                               barItemDescription: "返回",
                                               imageNamed: Asset.Navication.navBackW.name)

    static let message = YYNavigationBarItemModel(type: .message,
                                                  position: .left,
                                                  barItemDescription: "消息",
                                                  imageNamed: Asset.Navication.navMessageW.name)
    
    // Center
    static let title = YYNavigationBarItemModel(type: .title,
                                                position: .center,
                                                title: "YYImprove",
                                                barItemDescription: "标题")
    
    static let loginTitle = YYNavigationBarItemModel(type: .title,
                                                position: .center,
                                                title: "登录",
                                                barItemDescription: "标题")
    
    static let articleTitle = YYNavigationBarItemModel(type: .title,
                                                position: .center,
                                                title: "文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章",
                                                barItemDescription: "标题")
    
    static let foundTitle = YYNavigationBarItemModel(type: .title,
                                                    position: .center,
                                                    title: "发现发现发现发现发现发现发现发现发现发现发现发现发现发现发现发现发现发现发现发现",
                                                    barItemDescription: "标题")
    
    static let homeSearchBar = YYNavigationBarItemModel(type: .homeSearchBar,
                                                        position: .fit,
                                                        barItemDescription: "首页搜索栏",
                                                        imageNamed: "")
    
    // Right
    static let history = YYNavigationBarItemModel(type: .history,
                                                  position: .right,
                                                  barItemDescription: "历史记录",
                                                  imageNamed: Asset.Navication.navHistoryW.name)
    
    static let download = YYNavigationBarItemModel(type: .download,
                                                   position: .right,
                                                   barItemDescription: "下载",
                                                   imageNamed: Asset.Navication.navDownloadW.name)
    
    static let search = YYNavigationBarItemModel(type: .search,
                                                 position: .right,
                                                 barItemDescription: "搜索",
                                                 imageNamed: Asset.Navication.navSearchW.name)
    
    static let setting = YYNavigationBarItemModel(type: .setting,
                                                  position: .right,
                                                  barItemDescription: "设置",
                                                  imageNamed: Asset.Navication.navSettingW.name)
    
    // 登录页面-注册
    static let loginRegister = YYNavigationBarItemModel(type: .loginRegister,
                                                        position: .right,
                                                        title: "注册",
                                                        barItemDescription: "登录页面-注册")
}

protocol YYNavUniversalable {
    
}

// MARK: - 添加到视图的组件，需要自己主动设置位置
extension YYNavUniversalable where Self: UIView {
    
    // MARK: - 导航栏 通用组件
    func universal(model: YYNavigationBarItemModel, onNext: @escaping (_ model: YYNavigationBarItemModel) -> Void) -> UIButton {
        let btn = UIButton().then {
            // 设置属性
//            $0.backgroundColor = UIColor.green
            $0.setTitle(model.title, for: .normal)
            $0.titleLabel?.lineBreakMode = NSLineBreakMode.byTruncatingTail
            if model.imageNamed.count > 0 {
                $0.setImage(UIImage(named: model.imageNamed), for: .normal)
                $0.imageView?.contentMode = .scaleAspectFit
            }
            if model.imageNamed.count > 0 && model.highlightedImageNamed.count > 0 {
                $0.setImage(UIImage(named: model.highlightedImageNamed), for: .highlighted)
            }
            switch model.type {
            case .title:
                $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            default:
                $0.setTitleColor(UIColor.gray.alpha(0.9), for: .highlighted)
                $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            }
            // 处理点击事件
            $0.rx.tapGesture().when(.recognized)
                .subscribe({ _ in
                    onNext(model)
                }).disposed(by: rx.disposeBag)
        }
        return btn
    }
}

// MARK: - 添加到控制器的组件，指定位置即可
extension YYNavUniversalable where Self: UIViewController {

    // MARK: - 导航栏 通用组件
    func universals(aggregation: YYNavigationBarAggregation, onNext: @escaping (_ model: YYNavigationBarItemModel) -> Void) -> UIView {
        // 创建组件
        let titleView = UIView().then {
            $0.backgroundColor = kNavigationBackgroundColor
            self.view.addSubview($0)
            self.view.bringSubview(toFront: $0)
            $0.snp.makeConstraints({ (make) in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(MetricGlobal.kNavigationTabbarHight)
            })
        }
        initNavigationBar(titleView, aggregation: aggregation, onNext: onNext)
        return titleView
    }
    
    // MARK: - 导航栏 通用组件
    private func universal(model: YYNavigationBarItemModel, onNext: @escaping (_ model: YYNavigationBarItemModel) -> Void) -> UIButton {
        // 创建组件
        let btn = UIButton().then {
            // 设置属性
//            $0.backgroundColor = UIColor.green
            $0.setTitle(model.title, for: .normal)
            $0.titleLabel?.lineBreakMode = NSLineBreakMode.byTruncatingTail
            if model.imageNamed.count > 0 {
                $0.setImage(UIImage(named: model.imageNamed), for: .normal)
                $0.imageView?.contentMode = .scaleAspectFit
            }
            if model.imageNamed.count > 0 && model.highlightedImageNamed.count > 0 {
                $0.setImage(UIImage(named: model.highlightedImageNamed), for: .highlighted)
            }
            switch model.type {
            case .title:
                $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            default:
                $0.setTitleColor(UIColor.gray.alpha(0.9), for: .highlighted)
                $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            }
            // 处理点击事件
            $0.rx.tapGesture().when(.recognized)
                .subscribe({ _ in
                    onNext(model)
                }).disposed(by: rx.disposeBag)
        }
        return btn
    }

    // swiftlint:disable function_body_length
    private func initNavigationBar(_ titleView: UIView,
                                   aggregation: YYNavigationBarAggregation,
                                   onNext: @escaping (_ model: YYNavigationBarItemModel) -> Void) {
        // 用于判断对应位置是否存在按钮
        let hasLeftItems = aggregation.leftItems.count != 0
        let hasCenterItem = aggregation.centerItem != nil
        let hasRightItems = aggregation.rightItems.count != 0
        
        guard hasLeftItems || hasCenterItem || hasRightItems else { return }
        
        // 创建组件
        let view = UIView().then {
            $0.backgroundColor = .clear
            titleView.addSubview($0)
            $0.snp.makeConstraints({ (make) in
                make.left.right.equalToSuperview()
                make.bottom.equalToSuperview()
                make.height.equalTo(MetricGlobal.kNavigationTitleHight)
            })
        }
        
        // 导航中间部分的布局
        var itemCenterBtn: UIView?
        if hasCenterItem {
            itemCenterBtn = self.universal(model: aggregation.centerItem!) { model in
                onNext(model)
            }
            itemCenterBtn!.setContentHuggingPriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
            itemCenterBtn!.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: UILayoutConstraintAxis.horizontal)
            view.addSubview(itemCenterBtn!)
            itemCenterBtn!.snp.makeConstraints { (make) in
                switch aggregation.centerItem!.position {
                case .center, .left, .right:
                    if !hasLeftItems && !hasRightItems {
                        make.left.equalTo(MetricGlobal.padding)
                        make.right.equalTo(-MetricGlobal.padding)
                    } else {
                        make.centerX.equalToSuperview()
                    }
                case .fit:
                    if !hasLeftItems {
                        make.left.equalTo(MetricGlobal.padding)
                    }
                    if !hasRightItems {
                        make.right.equalTo(-MetricGlobal.padding)
                    }
                }
                make.centerY.equalToSuperview()
                make.height.equalToSuperview()
            }
        }
        
        // 导航左侧按钮布局
        var beforeLeftTemp: UIView?
        for index in 0..<aggregation.leftItems.count {
            let temp = aggregation.leftItems[index]
            let item = self.universal(model: temp) { model in
                onNext(model)
            }
            view.addSubview(item)
            
            item.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.height.equalToSuperview()
                if temp.title == nil {
                    make.width.equalTo(MetricGlobal.navigationItemSize)
                }
                if let beforeTemp = beforeLeftTemp {
                    make.left.equalTo(beforeTemp.snp.right)
                } else {
                    make.left.equalTo(MetricGlobal.padding)
                }
                if itemCenterBtn != nil && index == aggregation.leftItems.count - 1 {
                    make.right.lessThanOrEqualTo(itemCenterBtn!.snp.left).offset(-MetricGlobal.padding/2).priority(.high)
                    beforeLeftTemp = nil
                }
            }
            if aggregation.leftItems.count != 1 {
                beforeLeftTemp = item
            }
        }
        
        // 导航右侧按钮布局
        guard aggregation.rightItems.count != 0 else { return }
        var beforeRightTemp: UIView?
        for index in (0...aggregation.rightItems.count-1).reversed() {
            let temp = aggregation.rightItems[index]
            let item = self.universal(model: temp) { model in
                onNext(model)
            }
            view.addSubview(item)
            item.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                if temp.title == nil {
                    make.width.equalTo(MetricGlobal.navigationItemSize)
                }
                make.height.equalToSuperview()
                if let beforeTemp = beforeRightTemp {
                    make.right.equalTo(beforeTemp.snp.left)
                } else {
                    make.right.equalTo(-MetricGlobal.padding)
                }
                if itemCenterBtn != nil && index == 0 {
                    make.left.greaterThanOrEqualTo(itemCenterBtn!.snp.right).offset(MetricGlobal.padding/2).priority(.high)
                    beforeRightTemp = nil
                }
            }
            if aggregation.rightItems.count != 1 {
                beforeRightTemp = item
            }
        }
    }
    // swiftlint:enable function_body_length
}

struct YYNavigationBarAggregation {
    var leftItems: [YYNavigationBarItemModel]
    var centerItem: YYNavigationBarItemModel?
    var rightItems: [YYNavigationBarItemModel]
    
    init(leftItems: [YYNavigationBarItemModel],
         centerItem: YYNavigationBarItemModel?,
         rightItems: [YYNavigationBarItemModel]) {
        self.leftItems = leftItems
        self.centerItem = centerItem
        self.rightItems = rightItems
    }
}

// MARK: - 导航栏 通用组件 数据模型
class YYNavigationBarItemModel: NSObject {
    
    /// center与fit只允许同时存在一个
    enum YYNavigationBarItemPosition {
        case left
        case center
        case right
        case fit
    }
    
    enum YYNavigationBarItemType {
        case back
        case title
        case message
        case history
        case download
        case search
        case searchBar(index: Int, title: String)
        case setting
        case homeSearchBar              // 首页搜索栏
        case loginRegister
    }
    
    var type: YYNavigationBarItemType
    var position: YYNavigationBarItemPosition
    var title: String?
    var imageNamed: String
    var highlightedImageNamed: String
    var barItemDescription: String
    
    init(type: YYNavigationBarItemType,
         position: YYNavigationBarItemPosition,
         title: String,
         barItemDescription: String) {
        self.type = type
        self.position = position
        self.title = title
        self.barItemDescription = barItemDescription
        self.imageNamed = ""
        self.highlightedImageNamed = ""
    }
    
    init(type: YYNavigationBarItemType,
         position: YYNavigationBarItemPosition,
         barItemDescription: String,
         imageNamed: String) {
        self.type = type
        self.position = position
        self.title = nil
        self.barItemDescription = barItemDescription
        self.imageNamed = imageNamed
        self.highlightedImageNamed = ""
    }
    
    init(type: YYNavigationBarItemType,
         position: YYNavigationBarItemPosition,
         barItemDescription: String,
         imageNamed: String,
         highlightedImageNamed: String) {
        self.type = type
        self.position = position
        self.title = nil
        self.barItemDescription = barItemDescription
        self.imageNamed = imageNamed
        self.highlightedImageNamed = highlightedImageNamed
    }
}
