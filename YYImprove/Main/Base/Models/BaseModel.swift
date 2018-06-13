//
//  BaseResponse.swift
//  YYImprove
//
//  Created by YY on 2018/6/13.
//  Copyright © 2018年 com.yuyangstudio. All rights reserved.
//

import Foundation
import ObjectMapper

//{ \"retCode\": \"200\", \"msg\": \"success\", \"uid\": \"e5b0d1b60461ea4605cf27947f739bce\" }

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
