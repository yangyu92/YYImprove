//
//  NSLayoutConstraintOnePixelLine.swift
//  YYImprove
//  Xib布局中绘制一像素的线条
//
//  Created by YY on 2018/6/26.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

class NSLayoutConstraintOnePixelLine: NSLayoutConstraint {
    override func awakeFromNib() {
        super.awakeFromNib()
        if self.constant == 1 {
            self.constant = 1 / UIScreen.main.scale
        }
    }
}
