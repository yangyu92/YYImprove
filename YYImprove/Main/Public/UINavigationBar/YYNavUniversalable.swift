//
//  YYNavUniversalable.swift
//  YYImprove
//
//  Created by canyou on 2018/6/5.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

// MARK: - 常量
private struct Metric {
    static let itemSize: CGFloat = 30.0
}

// MARK: - 导航栏 通用组件
struct YYNavigationBarItemMetric {
    
    // Left
    static let back = YYNavigationBarItemModel(type: .back,
                                               position: .left,
                                               description: "返回",
                                               imageNamed: "ic_back_w")

    // Center
//    static let homeSearchBar = HCNavigationBarItemModel(type: .homeSearchBar,
//                                                        position: .center,
//                                                        description: "首页搜索栏",
//                                                        imageNamed: "")
    
    static let message = YYNavigationBarItemModel(type: .message,
                                                  position: .left,
                                                  description: "消息",
                                                  imageNamed: "top_message_n")
    
    static let history = YYNavigationBarItemModel(type: .history,
                                                  position: .right,
                                                  description: "历史记录",
                                                  imageNamed: "top_history_n")
    
    static let download = YYNavigationBarItemModel(type: .download,
                                                   position: .right,
                                                   description: "下载",
                                                   imageNamed: "top_download_n")
    
//    static let search = YYNavigationBarItemModel(type: .search,
//                                                 position: .right,
//                                                 description: "搜索",
//                                                 imageNamed: "icon_search_n")
    
    // Right

    static let setting = YYNavigationBarItemModel(type: .setting,
                                                  position: .right,
                                                  description: "设置",
                                                  imageNamed: "meSetNor")
    
//    // 登录页面-注册
//    static let loginRegister = YYNavigationBarItemModel(type: .title(index: 0, title: "注册"),
//                                                        position: .right,
//                                                        title: "注册",
//                                                        description: "登录页面-注册")
}

protocol YYNavUniversalable {
    
}

// MARK: - 添加到视图的组件，需要自己主动设置位置
extension YYNavUniversalable where Self: UIView {
    
    // MARK: - 导航栏 通用组件
    func universal(model: YYNavigationBarItemModel, onNext: @escaping (_ model: YYNavigationBarItemModel) -> Void) -> UIButton {
        let btn = UIButton().then {
            // 设置属性
            $0.contentMode = .scaleAspectFit
            $0.setTitle(model.title, for: .normal)
            $0.titleLabel?.lineBreakMode = NSLineBreakMode.byTruncatingTail
            if model.imageNamed.count > 0 {
                $0.setBackgroundImage(UIImage(named: model.imageNamed), for: .normal)
            }
            switch model.type {
            case .title:
                $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            default:
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 17)
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
    func universal(model: YYNavigationBarItemModel, onNext: @escaping (_ model: YYNavigationBarItemModel) -> Void) {
        var item: UIBarButtonItem
        if model.title != nil {
            // 标题
            item = UIBarButtonItem(title: model.title, style: .plain, target: nil, action: nil)
            item.rx.tap.do(onNext: {
                onNext(model)
            }).subscribe().disposed(by: rx.disposeBag)
        } else {
            // 图标
            let btn = UIButton(type: .custom)
            btn.setBackgroundImage(UIImage(named: model.imageNamed), for: .normal)
            if model.highlightedImageNamed.count > 0 {
                btn.setBackgroundImage(UIImage(named: model.highlightedImageNamed), for: .highlighted)
            }
            item = UIBarButtonItem(customView: btn)
            btn.rx.tap.do(onNext: {
                onNext(model)
            }).subscribe().disposed(by: rx.disposeBag)
        }
        switch model.position {
        case .left:
            if (navigationItem.leftBarButtonItems?.count ?? 0) == 0 {
                navigationItem.leftBarButtonItems = [item]
            } else {
                var items: [UIBarButtonItem] = [] + navigationItem.leftBarButtonItems!
                items.append(item)
                navigationItem.leftBarButtonItems = items
            }
        case .right:
            if (navigationItem.rightBarButtonItems?.count ?? 0) == 0 {
                navigationItem.rightBarButtonItems = [item]
            } else {
                var items: [UIBarButtonItem] = [] + navigationItem.rightBarButtonItems!
                items.append(item)
                navigationItem.rightBarButtonItems = items
            }
        default :
            break
        }
    }
    
    // MARK: - 导航栏 通用组件
    func universals(modelArr: [YYNavigationBarItemModel], onNext: @escaping (_ model: YYNavigationBarItemModel) -> Void) {
        
        modelArr.enumerated().forEach { (index, element) in
            let temp = element
            self.universal(model: temp) { model in
                onNext(model)
            }
        }
    }
}

// MARK: - 导航栏 通用组件 数据模型
struct YYNavigationBarItemModel {
    
    enum YYNavigationBarItemPosition {
        case left
        case center
        case right
    }
    
    enum YYNavigationBarItemType {
        case back
        case title
        case message
        case history
        case download
        case search(index: Int, title: String)
        case setting
        case homeSearchBar              // 首页搜索栏
    }
    
    var type: YYNavigationBarItemType
    var position: YYNavigationBarItemPosition
    var title: String?
    var description: String
    var imageNamed: String
    var highlightedImageNamed: String
    
    init(type: YYNavigationBarItemType,
         position: YYNavigationBarItemPosition,
         title: String,
         description: String) {
        self.type = type
        self.position = position
        self.title = title
        self.description = description
        self.imageNamed = ""
        self.highlightedImageNamed = ""
    }
    
    init(type: YYNavigationBarItemType,
         position: YYNavigationBarItemPosition,
         description: String,
         imageNamed: String) {
        self.type = type
        self.position = position
        self.title = nil
        self.description = description
        self.imageNamed = imageNamed
        self.highlightedImageNamed = ""
    }
    
    init(type: YYNavigationBarItemType,
         position: YYNavigationBarItemPosition,
         description: String,
         imageNamed: String,
         highlightedImageNamed: String) {
        self.type = type
        self.position = position
        self.title = nil
        self.description = description
        self.imageNamed = imageNamed
        self.highlightedImageNamed = highlightedImageNamed
    }
}
