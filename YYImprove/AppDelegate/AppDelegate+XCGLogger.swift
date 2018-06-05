//
//  AppDelegate+XCGLog.swift
//  YYImprove
//  日志管理类
//  Created by canyou on 2018/5/18.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import Foundation
import XCGLogger

let log = XCGLogger.default

extension AppDelegate {
    func setupXCGLogger() {
        log.remove(destinationWithIdentifier: XCGLogger.Constants.baseConsoleDestinationIdentifier)
        log.add(destination: AppleSystemLogDestination(identifier: XCGLogger.Constants.systemLogDestinationIdentifier))

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
        #else
            log.outputLevel = .error
        #endif
        
        log.logAppDetails()
    }
}
