//
//  LoginModel.swift
//  YYImprove
//
//  Created by YY on 2018/6/17.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import UIKit
import ObjectMapper

class LoginModel: BaseModel {
    var token: String?
    var uid: String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        token <- map["result.token"]
        uid <- map["result.uid"]
    }
}
