//
//  NoneReachabilityHelpViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/28.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import SnapKit
import Then

// MARK: - 常量
private struct Metric {

    static let titleFontSize: CGFloat = 15.0
    static let descFontSize: CGFloat = 13.0
}

class NoneReachabilityHelpViewController: YYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
        _ = initTitleView(title: "无网络连接")
    }

    override func viewWillAppear(_ animated: Bool) {
        reachabilitySwiftMessage.hide()
    }

    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        appDelegate.reachabilityShow()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NoneReachabilityHelpViewController {
    
    // swiftlint:disable function_body_length
    // MARK: - 初始化视图
    private func initUI() {
        let lblText1 = UILabel().then {
            $0.textColor = UIColor(hex: "#5C5F65")
            $0.font = UIFont.systemFont(ofSize: Metric.titleFontSize)
            $0.text = "请设置你的网络"
            self.view.addSubview($0)
        }
        let lblText2 = UILabel().then {
            $0.textColor = UIColor(hex: "#979797")
            $0.font = UIFont.systemFont(ofSize: Metric.descFontSize)
            $0.text = "1.打开设备的\"系统设置\">\"无线和网络\">\"移动网络\"。"
            self.view.addSubview($0)
        }
        let lblText3 = UILabel().then {
            $0.textColor = UIColor(hex: "#979797")
            $0.font = UIFont.systemFont(ofSize: Metric.descFontSize)
            $0.numberOfLines = 2
            $0.text = "2.打开设备的\"系统设置\">\"WLAN\"，\"启动WLAN\"后从中选择一个可用的热点连接。"
            self.view.addSubview($0)
        }
        
        let viewLine = UIView().then {
            $0.backgroundColor = UIColor(hex: "#EEEEEE")
            self.view.addSubview($0)
        }
        let lblText4 = UILabel().then {
            $0.textColor = UIColor(hex: "#5C5F65")
            $0.font = UIFont.systemFont(ofSize: Metric.titleFontSize)
            $0.text = "如果你已经连接Wi-Fi网络"
            self.view.addSubview($0)
        }
        let lblText5 = UILabel().then {
            $0.textColor = UIColor(hex: "#979797")
            $0.font = UIFont.systemFont(ofSize: Metric.descFontSize)
            $0.numberOfLines = 2
            $0.text = "请确认你所接入的Wi-Fi网络已经连入互联网，或者确认你的设备是否被允许访问该热点。"
            self.view.addSubview($0)
        }
        
        lblText1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kNavbarH + 5)
            make.right.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(40)
        }
        lblText2.snp.makeConstraints { (make) in
            make.top.equalTo(lblText1.snp.bottom)
            make.right.equalTo(lblText1.snp.right)
            make.left.equalTo(lblText1.snp.left)
        }
        lblText3.snp.makeConstraints { (make) in
            make.top.equalTo(lblText2.snp.bottom).offset(5)
            make.right.equalTo(lblText1.snp.right)
            make.left.equalTo(lblText1.snp.left)
        }
        viewLine.snp.makeConstraints { (make) in
            make.top.equalTo(lblText3.snp.bottom).offset(10)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(15)
        }
        lblText4.snp.makeConstraints { (make) in
            make.top.equalTo(viewLine.snp.bottom).offset(5)
            make.right.equalTo(lblText1.snp.right)
            make.left.equalTo(lblText1.snp.left)
            make.height.equalTo(40)
        }
        lblText5.snp.makeConstraints { (make) in
            make.top.equalTo(lblText4.snp.bottom)
            make.right.equalTo(lblText1.snp.right)
            make.left.equalTo(lblText1.snp.left)
        }
    }
    // swiftlint:enable function_body_length
    
    // MARK: - 绑定视图
    func bindUI() {
        
    }
}
