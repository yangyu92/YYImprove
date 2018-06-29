# YYImprove

demo地址: <https://github.com/yangyu92/YYImprove>

该项目使用swift编写,使用CocoaPods管理组件库,集成了一些常用的基础组件;为了避免重复搭建app项目

[TOC]

## 项目目录结构说明

项目整体结构使用MVVM+RxSwift+Moya+ObjectMapper

![GitHub set up](https://github.com/yangyu92/YYImprove/blob/master/image/project.png)

## 基础组件

1. 使用 [swiftlint](https://github.com/realm/SwiftLint) 规范化代码, 用来统一代码风格
2. 使用 [swiftGen](https://github.com/SwiftGen/SwiftGen) 管理图片与文字资源, 防止图片资源冗余混乱, 对文字处理可以使用国际化进行管理; 防止个别用户没有安装swiftGen,导致项目不能启动;

	通过本地添加的方式下载swiftGen包保存到项目中如下配置	需要添加"Run Script Phase"- 详情见项目
	
![GitHub set up](https://github.com/yangyu92/YYImprove/blob/master/image/RunScriptPhase.png)

3. [XCGLogger](https://github.com/DaveWoodCom/XCGLogger) 统一管理日志,可以实现本地日志保存,没有实现崩溃日志上传
4. [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift) 有无网络监听
5. [SwiftMessages](https://github.com/SwiftKickMobile/SwiftMessages) 消息提示统一管理
6. [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView) 加载动画
7. [SwiftyUserDefaults](https://github.com/radex/SwiftyUserDefaults) UserDefaults数据存储
8. [ESTabBarController-swift](https://github.com/eggswift/ESTabBarController) tab管理
9. [Hue](https://github.com/hyperoslo/Hue) 颜色处理
10. [SnapKit](https://github.com/SnapKit/SnapKit) 代码布局组件
11. [Then](https://github.com/devxoul/Then) 语法糖,方便创建
12. [Kingfisher](https://github.com/onevcat/Kingfisher)	 图片加载库
13. [Moya](https://github.com/Moya/Moya) 基于Alamofire的网络抽象层
15. [Alamofire](https://github.com/Alamofire/Alamofire) 网络请求
16. [RxSwift](https://github.com/ReactiveX/RxSwift) 响应式编程
18. [NSObject+Rx](https://github.com/RxSwiftCommunity/NSObject-Rx) 如果您使用的是RxSwift，那么您可能会多次遇到以下代码。使用此库将"disposeBag"添加到您的任何子类NSObject
19. [RxGesture](https://github.com/RxSwiftCommunity/RxGesture) RxSwift视图手势的反应包装
20. [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper) JSON 解析

##项目说明

由于对RxSwift的理解不够深入,有些不对的地方多多见谅; 代码结构都是参考网络上的其他开源组件

本文会持续更新,有什么不对的地方也欢迎大家指出




