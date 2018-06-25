//
//  LoginModel.swift
//  YYImprove
//
//  Created by YY on 2018/6/12.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import ObjectMapper

class RegisteredModel: BaseModel {
    var uid: String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        uid <- map["uid"]
    }
}
