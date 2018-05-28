//
//  FoundViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/24.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftMessages
import SnapKit
import Then

class FoundViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hex: "#ffffff")
        
        let label = UILabel().then {
            $0.textAlignment = .center
            $0.textColor = .black
            $0.text = L10n.tabTitleFound
        }
        self.view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        let button = UIButton().then {
            $0.setTitle("加载框", for: UIControlState.normal)
            $0.setTitleColor(UIColor.black, for: UIControlState.normal)
        }
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 80, height: 45))
            make.centerX.equalTo(label.snp.centerX)
            make.top.equalTo(label.snp.bottom).offset(15)
        }
        //按钮点击响应
        button.rx.tap.subscribe({_ in
            lodingSwiftMessage.showLoding(cancelFunction: { _ in
                lodingSwiftMessage.hide()
            })
        }).disposed(by: disposeBag)
        
        let button1 = UIButton().then {
            $0.setTitle("隐藏", for: UIControlState.normal)
            $0.setTitleColor(UIColor.black, for: UIControlState.normal)
            $0.tag = 2
        }
        self.view.addSubview(button1)
        button1.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 80, height: 45))
            make.centerX.equalTo(label.snp.centerX)
            make.top.equalTo(button.snp.bottom).offset(15)
        }
        //按钮点击响应
        button1.rx.tap.subscribe({_ in
            lodingSwiftMessage.hide()
        }).disposed(by: disposeBag)
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
