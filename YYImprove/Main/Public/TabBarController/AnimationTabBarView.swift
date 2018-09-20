//
//  AnimationTabBarView.swift
//  YYImprove
//
//  Created by yuyangstudio on 2018/4/29.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import Hue

class AnimationTabBarView: ESTabBarItemContentView {

    public var duration = 0.3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        textColor = kNavigationTitleColor
//        iconColor = kNavigationTitleColor

        highlightTextColor = kNavigationBackgroundColor
        highlightIconColor = kNavigationBackgroundColor
        
        itemContentMode = .alwaysOriginal
        
//        // 设置tab栏目背景颜色
//        backdropColor = UIColor(hex: "#78C9CC")
//        highlightBackdropColor = UIColor(hex: "#FFFFFF")
        
        titleLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func selectAnimation(animated: Bool, completion: (() -> Void)?) {
        self.bounceAnimation()
        completion?()
    }
    
    override func reselectAnimation(animated: Bool, completion: (() -> Void)?) {
        self.bounceAnimation()
        completion?()
    }
    
    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}
