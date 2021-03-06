//
//  FoundViewController.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/5/24.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftMessages
import SnapKit

class FoundViewController: YYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel().then {
            $0.textAlignment = .center
            $0.textColor = .black
            $0.text = L10n.tabTitleFound
        }
        self.view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        let button = UIButton().then {
            $0.setTitle("加载框", for: UIControl.State.normal)
            $0.setTitleColor(UIColor.black, for: UIControl.State.normal)
        }
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 80, height: 45))
            make.centerX.equalTo(label.snp.centerX)
            make.top.equalTo(label.snp.bottom).offset(15)
        }
        //按钮点击响应
        button.rx.tap.subscribe({_ in
            lodingSwiftMessage.showLoding()
        }).disposed(by: rx.disposeBag)
        
        let button1 = UIButton().then {
            $0.setTitle("隐藏", for: UIControl.State.normal)
            $0.setTitleColor(UIColor.black, for: UIControl.State.normal)
            $0.tag = 2
        }
        self.view.addSubview(button1)
        button1.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 80, height: 45))
            make.centerX.equalTo(label.snp.centerX)
            make.top.equalTo(button.snp.bottom).offset(15)
        }
        //按钮点击响应
        button1.rx.tap.subscribe({_ in
            lodingSwiftMessage.hide()
        }).disposed(by: rx.disposeBag)
        
        initTitleView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FoundViewController: YYNavUniversalable {
    private func initTitleView() {
        let model = YYNavigationBarAggregation(leftItems: [YYNavigationBarItemMetric.message],
                                               centerItem: YYNavigationBarItemMetric.foundTitle,
                                               rightItems: [YYNavigationBarItemMetric.history, YYNavigationBarItemMetric.setting])
        titleView = self.universals(aggregation: model) { (model) in
            let type = model.type
            switch type {
            case .message:
                SwiftMessages.showInfo(msg: "点击了系统信息")
            case .history:
                SwiftMessages.showInfo(msg: "点击了历史记录")
            default: break
            }
        }
        
    }
}
