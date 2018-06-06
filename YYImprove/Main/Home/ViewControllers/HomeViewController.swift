//
//  HomeViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/24.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import SwiftMessages

// MARK: - 常量
private struct Metric {
    static let searchBarLeft: CGFloat = 12.0
    static let searchBarRight: CGFloat = 12.0
}

class HomeViewController: YYBaseViewController {

    private var titleView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient: CAGradientLayer = [
            UIColor(hex: "#78C9CC"),
            UIColor(hex: "#3bb2bb")
            ].gradient { gradient in
                gradient.speed = 0
                gradient.timeOffset = 0
                gradient.locations = [0.0, 1.0]
                gradient.startPoint = CGPoint(x: 0, y: 0)
                gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
                gradient.frame = self.view.frame
                return gradient
        }
        self.view.layer.addSublayer(gradient)
        
        let label = UILabel().then {
            $0.textAlignment = .center
            $0.textColor = .black
            $0.text = L10n.tabTitleHome
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
//            DispatchQueue.main.async(execute: {
//                SwiftMessages.showInfo(msg: "默认提示信息home")
//            })
            self.jump2SearchResult()
        }).disposed(by: rx.disposeBag)
        
        initTitleView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension HomeViewController: YYNavTitleable {
    // MARK: - 标题组件
    private func initTitleView() {
        let homeNavigationBar = YYNavigationTitleBar("首页")
        
        homeNavigationBar.itemClicked = { [weak self] (model) in
            guard let `self` = self else { return }
            let type = model.type
            switch type {
            case .homeSearchBar:
                self.jump2SearchResult()
            case .download, .message, .history:
                self.jump2Login()
            default:
                break
            }
        }
        titleView = self.titleView(titleView: homeNavigationBar)
    }
}

// MARK: - 控制器跳转
extension HomeViewController {
    // MARK: - 搜索结果
    func jump2SearchResult() {
        let controller = RegisteredViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - 下载
    func jump2Login() {
        let controller = YYBaseNavigationController(rootViewController: LoginViewController())
        self.present(controller, animated: true, completion: nil)
    }
}
