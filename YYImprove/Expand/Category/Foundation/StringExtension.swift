//
//  StringExtension.swift
//  YYImprove
//
//  Created by YY on 2018/6/14.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit

public extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
    // MARK: - 获取字符串大小
    func getSize(fontSize: CGFloat) -> CGSize {
        let str = self as NSString
        
        let size = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(MAXFLOAT))
        return str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil).size
    }
    
    // MARK: - 获取字符串大小
    func getSize(font: UIFont) -> CGSize {
        let str = self as NSString
        
        let size = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(MAXFLOAT))
        return str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil).size
    }
}
