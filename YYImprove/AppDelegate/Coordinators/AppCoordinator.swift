//
//  AppCoordinator.swift
//  iOSSampleApp
//  主界面跳转方式(适合默认进入登录页,如果已登录就可以跳转该页面)
//
//  Created by Igor Kulman on 03/10/2017.
//  Copyright © 2017 Igor Kulman. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties

    private let window: UIWindow
    let container: Container
    private let rootTabBarController: YYRootTabBarController

    // MARK: - Coordinator core

    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        
        rootTabBarController = YYRootTabBarController()

        self.window.rootViewController = rootTabBarController
    }
    
    func start() {
        NSLog("测试 start")
    }

}
