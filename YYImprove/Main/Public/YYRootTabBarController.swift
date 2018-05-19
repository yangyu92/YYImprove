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

class YYRootTabBarController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 修改tabbar背景颜色时需要设置
//        self.tabBar.shadowImage = UIImage(named: "transparent")
//        self.tabBar.backgroundImage = UIImage(named: "background_dark")
        self.tabBar.shadowImage = UIImage(color: UIColor.clear, size: CGSize(width: 1, height: 1))
        self.tabBar.backgroundImage = UIImage(color: IGNavigationBackgroundColor, size: CGSize(width: 1, height: 1))
        
//        self.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0)
//        self.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -10)
        
        let controller1 = ViewController()
        let controller2 = ViewController()
        let controller3 = ViewController()
        let controller4 = ViewController()
        
        controller1.tabBarItem = ESTabBarItem.init(AnimationTabBarView(),
                                                   title: L10n.tabTitleHome,
                                                   image: UIImage(asset: Asset.Navication.tabHome),
                                                   selectedImage: UIImage(asset: Asset.Navication.tabHomeSelected))
        controller2.tabBarItem = ESTabBarItem.init(AnimationTabBarView(),
                                                   title: L10n.tabTitlePhoto,
                                                   image: UIImage(asset: Asset.Navication.tabPhoto),
                                                   selectedImage: UIImage(asset: Asset.Navication.tabPhotoSelected))
        controller3.tabBarItem = ESTabBarItem.init(AnimationTabBarView(),
                                                   title: L10n.tabTitleFavor,
                                                   image: UIImage(asset: Asset.Navication.tabFavor),
                                                   selectedImage: UIImage(asset: Asset.Navication.tabFavorSelected))
        controller4.tabBarItem = ESTabBarItem.init(AnimationTabBarView(),
                                                   title: L10n.tabTitleMe,
                                                   image: UIImage(asset: Asset.Navication.tabMe),
                                                   selectedImage: UIImage(asset: Asset.Navication.tabMeSelected))
        
        let navigation1 = YYBaseNavigationController.init(rootViewController: controller1)
        let navigation2 = YYBaseNavigationController.init(rootViewController: controller2)
        let navigation3 = YYBaseNavigationController.init(rootViewController: controller3)
        let navigation4 = YYBaseNavigationController.init(rootViewController: controller4)
        
        controller1.title = L10n.tabTitleHome
        controller2.title = L10n.tabTitlePhoto
        controller3.title = L10n.tabTitleFavor
        controller4.title = L10n.tabTitleMe
        
        self.viewControllers = [navigation1, navigation2, navigation3, navigation4]
        
//        self.selectedIndex = 1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
