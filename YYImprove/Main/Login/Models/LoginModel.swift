//
//  LoginModel.swift
//  YYImprove
//
//  Created by YY on 2018/6/12.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import Foundation
import ObjectMapper

//{ \"retCode\": \"200\", \"msg\": \"success\", \"uid\": \"e5b0d1b60461ea4605cf27947f739bce\" }

class LoginModel: Mappable {
    var retCode: String?
    var msg: String?
    var success: String?
    var uid: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        uid <- map["uid"]
        retCode <- map["retCode"]
        msg <- map["msg"]
        success <- map["success"]
    }
}
