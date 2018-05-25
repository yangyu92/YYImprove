//
//  YYRootTabBarController.swift
//  YYImprove
//
//  Created by canyou on 2018/4/29.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import Hue
import Reachability

class YYRootTabBarController: ESTabBarController {

//    var reachability: Reachability?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 修改tabbar背景颜色时需要设置
//        self.tabBar.shadowImage = UIImage(named: "transparent")
//        self.tabBar.backgroundImage = UIImage(named: "background_dark")
        self.tabBar.shadowImage = UIImage(color: UIColor.clear, size: CGSize(width: 1, height: 1))
        self.tabBar.backgroundImage = UIImage(color: IGNavigationBackgroundColor, size: CGSize(width: 1, height: 1))
        
//        self.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0)
//        self.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -10)
        
        let controller1 = HomeViewController()
        let controller2 = ArticleViewController()
        let controller3 = FoundViewController()
        let controller4 = MeViewController()
        
        controller1.tabBarItem = ESTabBarItem.init(AnimationTabBarView(),
                                                   title: L10n.tabTitleHome,
                                                   image: UIImage(asset: Asset.Navication.tabHome),
                                                   selectedImage: UIImage(asset: Asset.Navication.tabHomeSelected))
        controller2.tabBarItem = ESTabBarItem.init(AnimationTabBarView(),
                                                   title: L10n.tabTitleArticle,
                                                   image: UIImage(asset: Asset.Navication.tabPhoto),
                                                   selectedImage: UIImage(asset: Asset.Navication.tabPhotoSelected))
        controller3.tabBarItem = ESTabBarItem.init(AnimationTabBarView(),
                                                   title: L10n.tabTitleFound,
                                                   image: UIImage(asset: Asset.Navication.tabFavor),
                                                   selectedImage: UIImage(asset: Asset.Navication.tabFavorSelected))
        controller4.tabBarItem = ESTabBarItem.init(AnimationTabBarView(),
                                                   title: L10n.tabTitleMe,
                                                   image: UIImage(asset: Asset.Navication.tabMe),
                                                   selectedImage: UIImage(asset: Asset.Navication.tabMeSelected))
        
//        let navigation1 = YYBaseNavigationController.init(rootViewController: controller1)
        let navigation2 = YYBaseNavigationController.init(rootViewController: controller2)
        let navigation3 = YYBaseNavigationController.init(rootViewController: controller3)
        let navigation4 = YYBaseNavigationController.init(rootViewController: controller4)
        
        controller1.title = L10n.tabTitleHome
        controller2.title = L10n.tabTitleArticle
        controller3.title = L10n.tabTitleFound
        controller4.title = L10n.tabTitleMe
        
        self.viewControllers = [controller1, navigation2, navigation3, navigation4]
        
//        self.selectedIndex = 1
        
//        setupReachability()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func setupReachability() {
//        self.reachability = Reachability()
//        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
//        do {
//            try reachability?.startNotifier()
//        } catch {
//            log.error("启动网络监听失败")
//        }
//    }
//    func stopNotifier() {
//        reachability?.stopNotifier()
//        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
//        reachability = nil
//    }
//
//    @objc func reachabilityChanged(note: Notification) {
//        let reachability = note.object as! Reachability
//        switch reachability.connection {
//        case .wifi:
//            log.info("有wifi")
//            self.showAlert("提示", message: "有wifi")
//        case .cellular:
//            log.info("移动网络")
//            self.showAlert("提示", message: "移动网络")
//        case .none:
//            log.info("没有网络")
//            self.showAlert("提示", message: "没有网络")
//        }
//    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
//    deinit {
//        stopNotifier()
//    }
}
