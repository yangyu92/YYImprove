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

    // swiftlint:disable function_body_length
    override func viewDidLoad() {
        super.viewDidLoad()

        // 修改tabbar背景颜色时需要设置
        self.tabBar.shadowImage = UIImage(color: UIColor.clear, size: CGSize(width: 1, height: 1))
        self.tabBar.backgroundImage = UIImage(color: IGNavigationBackgroundColor, size: CGSize(width: 1, height: 1))
        
//        self.tabBarItem.imageInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: -20, right: 0)
//        self.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -20)
        
        let controller1 = HomeViewController()
        let controller2 = ArticleViewController()
        let controller3 = FoundViewController()
        let controller4 = MeViewController()
        let controller5 = UIViewController()
        
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
        
        let navigation1 = YYBaseNavigationController.init(rootViewController: controller1)
        let navigation2 = YYBaseNavigationController.init(rootViewController: controller2)
        let navigation3 = YYBaseNavigationController.init(rootViewController: controller3)
        let navigation4 = YYBaseNavigationController.init(rootViewController: controller4)
        let navigation5 = YYBaseNavigationController.init(rootViewController: controller5)
        
        controller1.title = L10n.tabTitleHome
        controller2.title = L10n.tabTitleArticle
        controller3.title = L10n.tabTitleFound
        controller4.title = L10n.tabTitleMe
        
        controller5.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(),
                                                   title: nil,
                                                   image: UIImage(asset: Asset.Navication.photoVerybig),
                                                   selectedImage: UIImage(asset: Asset.Navication.photoVerybig))
        
        self.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        self.didHijackHandler = { tabbarController, viewController, index in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
                alertController.addAction(takePhotoAction)
                let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
                alertController.addAction(selectFromAlbumAction)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        self.viewControllers = [navigation1, navigation2, navigation5, navigation3, navigation4]
        
//        self.selectedIndex = 1
    }
    // swiftlint:enable function_body_length
    
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
