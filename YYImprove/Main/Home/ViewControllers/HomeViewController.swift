//
//  HomeViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/24.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import SwiftMessages

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient: CAGradientLayer = [
            UIColor(hex: "#78C9CC"),
            UIColor(hex: "#3bb2bb")
            ].gradient { gradient in
                gradient.speed = 0
                gradient.timeOffset = 0
                gradient.locations = [0.0, 1.0]
                gradient.startPoint = CGPoint(x: 0, y: 0)
                gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
                gradient.frame = self.view.frame
                return gradient
        }
        
        self.view.layer.addSublayer(gradient)
        
//        self.view.backgroundColor = UIColor(hex: "#ffffff")

        let label = UILabel().then {
            $0.textAlignment = .center
            $0.textColor = .black
            $0.text = L10n.tabTitleHome
        }
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        let button = UIButton().then {
            $0.setTitle("确认", for: UIControlState.normal)
        }
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 80, height: 45))
            make.centerX.equalTo(label.snp.centerX)
            make.top.equalTo(label.snp.bottom).offset(15)
        }
        //按钮点击响应
        button.rx.tap.subscribe({_ in
            DispatchQueue.main.async(execute: {
                SwiftMessages.showInfo(msg: "默认提示信息home")
            })
        }).disposed(by: rx.disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
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
