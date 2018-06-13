//
//  CALayerExtension.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/6/9.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension CALayer {
    func pauseAnimate() {
        let pausedTime = self.convertTime(CACurrentMediaTime(), from: nil)
        self.speed = 0.0
        self.timeOffset = pausedTime
    }
    
    func resumeAnimate() {
        let pausedTime = self.timeOffset
        self.speed = 1.0
        self.timeOffset = 0.0
        self.beginTime = 0.0
        let timeSincePause = self.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        self.beginTime = timeSincePause
    }
}
#endif
