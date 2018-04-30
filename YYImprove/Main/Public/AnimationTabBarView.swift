//
//  AnimationTabBarView.swift
//  YYImprove
//
//  Created by canyou on 2018/4/29.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import Hue

class AnimationTabBarView: ESTabBarItemContentView {

    public var duration = 0.3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = IGNavigationTitleColor
        highlightTextColor = IGNavigationTitleColor
        iconColor = IGNavigationTitleColor
        highlightIconColor = IGNavigationTitleColor
        
//        // 设置tab栏目背景颜色
//        backdropColor = UIColor(hex: "#78C9CC")
//        highlightBackdropColor = UIColor(hex: "#FFFFFF")
        
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
        impliesAnimation.calculationMode = kCAAnimationCubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}
