//
//  RegisteredViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/24.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit

class RegisteredViewController: YYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = initTitleView(title: "注册")
        
        let label = UILabel().then {
            $0.textAlignment = .center
            $0.textColor = .black
            $0.text = L10n.tabTitleMe
        }
        self.view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        let button = UIButton().then {
            $0.setTitle("确认", for: UIControlState.normal)
            $0.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 80, height: 45))
            make.centerX.equalTo(label.snp.centerX)
            make.top.equalTo(label.snp.bottom).offset(15)
        }
        //按钮点击响应
        button.rx.tap.subscribe({_ in
            DispatchQueue.main.async(execute: {
                let controller = RegisteredViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            })
        }).disposed(by: rx.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 启用滑动返回
//        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
