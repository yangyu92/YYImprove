//
//  RequestPluginExample.swift
//  MoyaStudy
//
//  Created by fancy on 2017/4/13.
//  Copyright © 2017年 王森. All rights reserved.
//

import Foundation
import Moya
import Result

let newworkActivityPlugin = NetworkActivityPlugin { (change: NetworkActivityChangeType, target: TargetType) in
    switch change {
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        Thread.sleep(forTimeInterval: 3.0)
    case .began:
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}

struct AuthPlugin: PluginType {
    let token: String
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        request.timeoutInterval = 30
        request.addValue(token, forHTTPHeaderField: "token")
        return request
    }
}

public final class RequestLoadingPlugin: PluginType {
    var hide: Bool
    init(_ hideView: Bool) {
        self.hide = hideView
        guard self.hide else {
            return
        }
    }
    
    public func willSend(_ request: RequestType, target: TargetType) {
        if self.hide  != false {
            lodingSwiftMessage.showLoding()
        }
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        lodingSwiftMessage.hide()
    }
}

////检测token有效性
//final class AccessTokenPlugin: PluginType {
//    private let viewController: UIViewController
//
//    init(_ vc: UIViewController) {
//        self.viewController = vc
//    }
//
//    public func willSend(_ request: RequestType, target: TargetType) {
//
//    }
//
//    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
//        switch result {
//
//        case .success(let response):
//        //请求状态码
//            guard  response.statusCode == 200   else {
//                return
//            }
//            var json:Dictionary? = try! JSONSerialization.jsonObject(with: response.data, options:.allowFragments) as! [String: Any]
//
//            print("请求状态码\(json?["status"] ?? "")")
//
//            guard (json?["message"]) != nil  else {
//                return
//            }
//
//            guard let codeString = json?["status"] else { return }
//
//            //请求状态为1时候立即返回不弹出任何提示 否则提示后台返回的错误信息
//            guard codeString as! Int != 1 else{return}
//           self.viewController.view .makeToast( json?["message"] as! String)
//
//        case .failure(let error):
//            print("出错了\(error)")
//
//            break
//        }
//    }
//}
