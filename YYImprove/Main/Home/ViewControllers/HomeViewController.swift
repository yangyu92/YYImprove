//
//  HomeViewController.swift
//  YYImprove
//
//  Created by canyou on 2018/5/24.
//  Copyright © 2018年 com.canyou. All rights reserved.
//

import UIKit
import Then
import SnapKit

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
        
        // Do any additional setup after loading the view.
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
