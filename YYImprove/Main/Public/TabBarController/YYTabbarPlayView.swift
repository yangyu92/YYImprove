//
//  HCTabbarPlayView.swift
//  RxXMLY
//
//  Created by sessionCh on 2018/1/23.
//  Copyright © 2018年 sessionCh. All rights reserved.
//  播放按钮

import UIKit
import RxSwift
import RxCocoa
import Then
import ESTabBarController_swift

// MARK: - 常量
private struct Metric {
    static let width: CGFloat = 66.0     // 控件大小
    static let topMargin: CGFloat = 18.0
    static let spaceWidth: CGFloat = 8.0    // 圆环间距
    static let imageWidth: CGFloat = Metric.width - Metric.spaceWidth * 2
    static let iconWidth: CGFloat = 30
    
    static let imageAnimKey: String = "backgroundImageAnim"
}

class YYTabbarPlayView: ESTabBarItemContentView {
    
    var isPlay: Variable<Bool> = Variable(false)                // 播放状态
    
    // MARK: - 成功回调
    typealias AddBlock = (_ isPlay: Bool) -> Void
    var playBtnClickedBlock: AddBlock? = {
        (_) in return
    }
    private let backgroundView = UIView().then {
//        $0.backgroundColor = kNavigationBackgroundColor
        $0.backgroundColor = kThemeWhiteColor
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = Metric.width / 2
    }
    
    var backgroundImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = Metric.imageWidth / 2
        $0.layer.borderColor = kThemeGainsboroColor.cgColor
        $0.layer.borderWidth = 0.5
    }

    let iconView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(asset: Asset.Navication.tabPlayW)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        bindUI()
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public override func selectAnimation(animated: Bool, completion: (() -> Void)?) {
        completion?()
    }
    public override func reselectAnimation(animated: Bool, completion: (() -> Void)?) {
        completion?()
    }
    public override func deselectAnimation(animated: Bool, completion: (() -> Void)?) {
        completion?()
    }
    public override func highlightAnimation(animated: Bool, completion: (() -> Void)?) {
        completion?()
    }
    public override func dehighlightAnimation(animated: Bool, completion: (() -> Void)?) {
        completion?()
    }
}

extension YYTabbarPlayView {
    private func initUI() {
        self.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-Metric.topMargin)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(Metric.width)
        }
        
        backgroundView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(Metric.imageWidth)
        }
        
        backgroundView.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(Metric.iconWidth)
        }
        addRotationAnimation(image: UIImage(asset: Asset.Public.playDefault))
    }
    
    func addRotationAnimation(image: UIImage) {
        backgroundImageView.image = image
        
        let anim = CABasicAnimation(keyPath: "transform.rotation.z").then {
            $0.fromValue = 0.0
            $0.toValue = Double.pi * 2
            $0.duration = 10
            $0.repeatCount = MAXFLOAT
            $0.isRemovedOnCompletion = false
        }
        // 1.移除之前的动画
        backgroundImageView.layer.removeAnimation(forKey: Metric.imageAnimKey)
        backgroundImageView.layer.add(anim, forKey: Metric.imageAnimKey)
    }
    
    // MARK: - 更新UI
    private func updatePlayStatus(isPlay: Bool) {
        if isPlay {
            self.iconView.isHidden = true
            backgroundImageView.layer.resumeAnimate()
        } else {
            self.iconView.isHidden = false
            backgroundImageView.layer.pauseAnimate()
        }
    }
    
    private func bindUI() {
        // 绑定事件
        isPlay.asObservable().subscribe(onNext: { [weak self] beel in
            guard let `self` = self else { return }
            // 更新状态
            self.updatePlayStatus(isPlay: beel)
            // 回调处理
            self.playBtnClickedBlock?(self.isPlay.value)
            
        }).disposed(by: rx.disposeBag)
        
        // 点击事件
        self.rx.tapGesture().when(.recognized).subscribe({ [weak self]  _ in
            guard let `self` = self else { return }
            // 点击 进入 播放状态
            self.isPlay.value = !self.isPlay.value
        }).disposed(by: rx.disposeBag)
    }
}
