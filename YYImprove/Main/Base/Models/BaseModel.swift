//
//  BaseResponse.swift
//  YYImprove
//
//  Created by YY on 2018/6/13.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseModel: Mappable {
    
    var retCode: String!
    var msg: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        retCode <- map["retCode"]
        msg <- map["msg"]
    }
}
