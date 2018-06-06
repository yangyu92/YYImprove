//
//  FoundViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/24.
//  Copyright © 2018年 com.canyou. All rights reserved.
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
            $0.setTitle("加载框", for: UIControlState.normal)
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
            lodingSwiftMessage.showLoding()
        }).disposed(by: rx.disposeBag)
        
        let button1 = UIButton().then {
            $0.setTitle("隐藏", for: UIControlState.normal)
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
            lodingSwiftMessage.hide()
        }).disposed(by: rx.disposeBag)
        
        initTitleView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - 自定义导航
extension FoundViewController: YYNavTitleable {
    private func initTitleView() {
        let homeNavigationBar = YYFoundNavigationBar()
        
        homeNavigationBar.itemClicked = { [weak self] (model) in
            guard let `self` = self else { return }
            let type = model.type
            switch type {
            case .search:
                let controller = LoginViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            case .download, .message, .history:
                let controller = RegisteredViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            default:
                break
            }
        }
        titleView = self.titleView(titleView: homeNavigationBar)
    }
}
