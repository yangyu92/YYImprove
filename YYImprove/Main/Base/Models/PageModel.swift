//
//  PageModel.swift
//  YYImprove
//
//  Created by YY on 2018/6/13.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import ObjectMapper

class PageModel<T: Mappable>: Mappable {
    
    var curPage: String!
    var total: String!
    var list: [T]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        curPage <- map["curPage"]
        total <- map["total"]
        list <- map["list"]
    }
}
