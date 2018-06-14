//
//  BasePageModel.swift
//  YYImprove
//
//  Created by YY on 2018/6/13.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import ObjectMapper

class BasePageModel: BaseModel {
    
    var result: String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        result <- map["result"]
    }
}
