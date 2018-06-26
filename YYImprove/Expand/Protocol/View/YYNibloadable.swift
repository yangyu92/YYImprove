//
//  YYNibloadable.swift
//  YYImprove
//
//  Created by YY on 2018/6/26.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

protocol NibLoadable { }

extension NibLoadable where Self: UIView {
    
    static func loadFromNib(_ nibNmae: String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}
