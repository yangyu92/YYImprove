//
//  MeViewController.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/5/24.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import SwiftyUserDefaults

class MeViewController: YYBaseViewController {
    
    var scrollview: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient: CAGradientLayer = [
            UIColor(hex: "#53c7f0"),
            UIColor(hex: "#87e0ff")
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
        
        scrollview = UIScrollView().then {
            $0.contentSize = CGSize(width: kScreenWidth, height: 1000)
            $0.scrollIndicatorInsets = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
            $0.backgroundColor = .clear
            self.view.addSubview($0)
            $0.snp.makeConstraints({ (make) in
                make.edges.equalToSuperview()
            })
        }
        scrollview.delegate = self
        
        let label = UILabel().then {
            $0.textAlignment = .center
            $0.textColor = .black
            $0.text = L10n.tabTitleMe
            scrollview.addSubview($0)
            $0.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
            }
        }
        
        let button = UIButton().then {
            $0.setTitle("确认", for: UIControlState.normal)
            $0.setTitleColor(UIColor.black, for: UIControlState.normal)
            scrollview.addSubview($0)
            $0.snp.makeConstraints { (make) in
                make.size.equalTo(CGSize(width: 80, height: 45))
                make.centerX.equalTo(label.snp.centerX)
                make.top.equalTo(label.snp.bottom).offset(15)
            }
        }
        
        //按钮点击响应
        button.rx.tap.subscribe(onNext: {_ in
            
            DispatchQueue.main.async(execute: {
                let controller = ViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            })
            
//            if button.isSelected {
//                Defaults[.token] = "tokenTest"
//            } else {
//                Defaults[.token] = ""
//            }
//            button.isSelected = !button.isSelected
            
        }).disposed(by: rx.disposeBag)
        
        initTitleView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scrollViewDidScroll(scrollview)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        // 调整导航栏背景色渐变
        let offsetY: CGFloat = scrollView.contentOffset.y
//        log.info(offsetY)
        if offsetY < 100 {
            let alpha: CGFloat = max(0, 1 - (100 - offsetY) / MetricGlobal.kNavigationTabbarHight)
            titleView?.backgroundColor = kNavigationBackgroundColor.withAlphaComponent(alpha)
        } else {
            titleView?.backgroundColor = kNavigationBackgroundColor.withAlphaComponent(1)
        }
        
//        // 缩放图片
//        if (offsetY < 0) {
//            // 减去初始部分
//            let scaleXY = 1  - tempScale + offsetY / (-600)
//            imageView.transform = CGAffineTransform(scaleX: scaleXY, y: scaleXY)
//        }
    }
}
// MARK: - 自定义导航
extension MeViewController: YYNavTitleable {
    private func initTitleView() {
        let meNavigationBar = YYMeNavigationBar()
        
        meNavigationBar.itemClicked = { [weak self] (model) in
            guard let `self` = self else { return }
            let type = model.type
            switch type {
            case .message:
                let controller = YYBaseNavigationController(rootViewController: LoginViewController())
                self.present(controller, animated: true, completion: nil)
            case .search:
                let controller = RegisteredViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            default:
                break
            }
        }
        titleView = self.titleView(titleView: meNavigationBar)
    }
}
