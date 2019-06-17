//
//  AppDelegate+XCGLog.swift
//  YYImprove
//  日志管理类
//  Created by YY on 2018/5/18.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import XCGLogger
import GDPerformanceView_Swift

let log = XCGLogger.default

extension AppDelegate {
    func setupXCGLogger() {
        
        // 默认添加一个日志文件
//        log.remove(destinationWithIdentifier: XCGLogger.Constants.baseConsoleDestinationIdentifier)
//        log.add(destination: AppleSystemLogDestination(identifier: XCGLogger.Constants.systemLogDestinationIdentifier))

        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        // Create a file log destination
        let logPath: URL = urls[urls.endIndex - 1].appendingPathComponent("XCGLogger_Log.txt")
        let autoRotatingFileDestination = AutoRotatingFileDestination(writeToFile: logPath,
                                                                      identifier: "advancedLogger.fileDestination",
                                                                      shouldAppend: true,
                                                                      attributes: [.protectionKey: FileProtectionType.completeUntilFirstUserAuthentication],
                                                                      maxFileSize: 1024 * 5,
                                                                      maxTimeInterval: 60)
        autoRotatingFileDestination.targetMaxLogFiles = 10
        autoRotatingFileDestination.logQueue = XCGLogger.logQueue
        log.add(destination: autoRotatingFileDestination)
        #if DEBUG
        log.outputLevel = .debug
        print("debug")
        #else
        log.outputLevel = .error
        print("error")
        #endif
        
        log.logAppDetails()
    }
    
    func setupStartMonitoring() {
        //        GDPerformanceMonitor.sharedInstance.startMonitoring()
        let gdp = GDPerformanceMonitor.sharedInstance
        gdp.appVersionHidden = true
        gdp.deviceVersionHidden = true
        gdp.startMonitoring()
    }
}
