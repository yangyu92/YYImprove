//
//  YYRootTabBarController.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/4/29.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import NSObject_Rx
import Hue
import Then

class YYRootTabBarController: ESTabBarController {

    // 播放按钮
    var playView = YYTabbarPlayView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViewControllers()
        // 设置阴影
        self.tabBar.layer.shadowColor = kThemeLightGreyColor.alpha(0.8).cgColor
        self.tabBar.layer.shadowOpacity = 0.6
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        self.tabBar.layer.shadowRadius = 3
        // 去掉线条与透明度
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundImage = UIImage.init()
        UITabBar.appearance().shadowImage = UIImage.init()
//        UITabBar.appearance().barTintColor = kThemeWhiteColor
//        UITabBar.appearance().tintColor = kThemeTomatoColor
//        // 修改tabbar背景颜色时需要设置
//        self.tabBar.shadowImage = UIImage(color: UIColor.clear, size: CGSize(width: 1, height: 1))
//        self.tabBar.backgroundImage = UIImage(color: kNavigationBackgroundColor, size: CGSize(width: 1, height: 1))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - 初始化
extension YYRootTabBarController {
    private func initSubViewControllers() {
        let classNameArr = ["Home", "Article", "Found", "Me"]
        let moduleNameArr = [L10n.tabTitleHome,
                             L10n.tabTitleArticle,
                             L10n.tabTitleFound,
                             L10n.tabTitleMe]
        let imageArr = [Asset.Navication.tabHome,
                        Asset.Navication.tabPhoto,
                        Asset.Navication.tabFavor,
                        Asset.Navication.tabMe]
        let selectedImageArr = [Asset.Navication.tabHomeSelected,
                                Asset.Navication.tabPhotoSelected,
                                Asset.Navication.tabFavorSelected,
                                Asset.Navication.tabMeSelected]
        
        var tabArr: [UIViewController] = []
        let projectName = self.getProjectName()
        
        for i in 0..<classNameArr.count {
            let clsName = classNameArr[i]
            let moduleName = moduleNameArr[i]
            let image = UIImage(asset: imageArr[i])
            let selectedImage = UIImage(asset: selectedImageArr[i])
            let clsType = NSClassFromString("\(projectName)\(clsName)ViewController") as! UIViewController.Type
            let controller = clsType.init()
            controller.title = moduleName
            let item: UITabBarItem = ESTabBarItem.init(AnimationTabBarView(),
                                      title: moduleName,
                                      image: image,
                                      selectedImage: selectedImage)
            item.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
            controller.tabBarItem = item
            let navVc = YYBaseNavigationController(rootViewController: controller)
            tabArr.append(navVc)
        }
        let controller2 = UIViewController()
        controller2.tabBarItem = ESTabBarItem.init(playView,
                                                   title: nil,
                                                   image: nil,
                                                   selectedImage: nil)
        tabArr.insert(controller2, at: 2)
        self.viewControllers = tabArr
        self.shouldHijackHandler = shouldHijackHandlerEvent
        self.didHijackHandler = didHijackHandlerEvent
    }
    
    private func getProjectName() -> String {
        guard let infoDict = Bundle.main.infoDictionary else {
            return "."
        }
        let key = kCFBundleExecutableKey as String
        guard let value = infoDict[key] as? String else {
            return "."
        }
        return value + "."
    }
}

// MARK: - 代理
extension YYRootTabBarController {
    
    private func shouldHijackHandlerEvent(_ tabBarController: UITabBarController, _ viewController: UIViewController, _ index: Int) -> Bool {
        if index == 2 {
            return true
        }
        return false
    }
    
    private func didHijackHandlerEvent(_ tabBarController: UITabBarController, _ viewController: UIViewController, _ index: Int) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
//            let takePhotoAction = UIAlertAction(title: "打开相机", style: .default, handler: nil)
//            alertController.addAction(takePhotoAction)
//            let selectFromAlbumAction = UIAlertAction(title: "选择照片", style: .default, handler: nil)
//            alertController.addAction(selectFromAlbumAction)
//            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//            alertController.addAction(cancelAction)
//            self.present(alertController, animated: true, completion: nil)
//        }
    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
