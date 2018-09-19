//
//  AppDelegate.swift
//  YYImprove
//
//  Created by YY on 2018/4/27.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let rootTabBarController = YYRootTabBarController()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupXCGLogger()
        
        setupReachability()
        
        loadRootViewController()
        
        return true
    }

    func loadRootViewController() {
        
        Defaults[.launchCount] += 1
        let launchCount = Defaults[.launchCount]
        log.info("启动次数:\(launchCount)")
        
        log.info("系统版本:\(UIDevice.current.modelName)")
        
        window = UIWindow(frame: kScreenBounds)
        self.window?.rootViewController = rootTabBarController
        self.loadLaunchScreen()
        self.window!.makeKeyAndVisible()
        
        setupStartMonitoring()
    }
    
    func loadLaunchScreen() {
        let viewController = UIStoryboard.init(name: "LaunchScreen", bundle: nil).instantiateViewController(withIdentifier: "LaunchScreenIdentity")
        let launchView = viewController.view
        launchView?.frame = kScreenBounds
        self.window?.rootViewController?.view.addSubview(launchView!)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
            launchView?.alpha = 0.0
            launchView?.layer.transform = CATransform3DScale(CATransform3DIdentity, 2.0, 2.0, 1.0)
        }, completion: { finish in
            launchView?.removeFromSuperview()
        })
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        stopReachabilityNotifier()
    }

}
