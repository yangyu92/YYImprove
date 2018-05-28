//
//  LodingMessageView.swift
//  YYImprove
//
//  Created by canyou on 2018/5/27.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import SwiftMessages
import NVActivityIndicatorView

class LodingMessageView: MessageView {

    @IBOutlet weak var activityLoadingView: NVActivityIndicatorView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
//        self.activityLoadingView.type = NVActivityIndicatorType.lineScale
        self.activityLoadingView.type = NVActivityIndicatorType.lineScalePulseOut
//        self.activityLoadingView.type = NVActivityIndicatorType.ballSpinFadeLoader
//        self.activityLoadingView.type = NVActivityIndicatorType.pacman
        self.activityLoadingView.startAnimating()
    }
    
}
