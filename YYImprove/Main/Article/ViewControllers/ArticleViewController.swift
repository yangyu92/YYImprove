//
//  ArticleViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/24.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftMessages

class ArticleViewController: UIViewController {

    let otherMessages = SwiftMessages()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#ffffff")
        
        let label = UILabel().then {
            $0.textAlignment = .center
            $0.textColor = .black
            $0.text = L10n.tabTitleArticle
        }
        self.view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        let button = UIButton().then {
            $0.setTitle("确认", for: UIControlState.normal)
            $0.setTitleColor(UIColor.black, for: UIControlState.normal)
            $0.tag = 1
        }
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 80, height: 45))
            make.centerX.equalTo(label.snp.centerX)
            make.top.equalTo(label.snp.bottom).offset(15)
        }
        //按钮点击响应
        button.rx.tap.subscribe({_ in
            log.info("点击第一个按钮")
            SwiftMessages.showInfo(msg: "默认提示信息")
            SwiftMessages.showSuccess(msg: "成功提示信息")
            SwiftMessages.showWarning(msg: "警告提示信息")
            SwiftMessages.showError(msg: "异常提示信息")
        }).disposed(by: rx.disposeBag)

        let button1 = UIButton().then {
            $0.setTitle("确认", for: UIControlState.normal)
            $0.setTitleColor(UIColor.black, for: UIControlState.normal)
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
            log.info("点击第二个按钮")
            SwiftMessages.showWarning(msg: "成功提示信息成功提示信息")
        }).disposed(by: rx.disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
