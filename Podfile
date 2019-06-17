source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

swift_41_pod_targets = ['GDPerformanceView-Swift','SwiftyUserDefaults']

post_install do | installer |
    installer.pods_project.targets.each do |target|
        if swift_41_pod_targets.include?(target.name)
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.1'
            end
        end
    end
end

inhibit_all_warnings!   # 去除第三方的警告
use_frameworks!         # 修改引入方式，加了这句引入使用#import””;未加使用#import <>

target 'YYImprove' do

    # 基于Alamofire的网络抽象层
    pod 'Moya', '12.0.0-beta.1’
    pod 'Moya/RxSwift', '12.0.0-beta.1'
    pod 'RxSwift', '4.3.1'
    pod 'RxCocoa', '4.3.1'
    pod 'RxDataSources', '3.1.0'
    pod 'ReusableKit', '2.1.0'
    pod 'Alamofire', '4.7.3’
    pod 'ReachabilitySwift', '4.2.1'
    
    # 如果您使用的是RxSwift，那么您可能会多次遇到以下代码。使用此库将"disposeBag"添加到您的任何子类NSObject
    pod 'NSObject+Rx', '4.4.0'
    
    # RxSwift视图手势的反应包装
    pod 'RxGesture', '2.0.0'

    # JSON 解析
    pod 'ObjectMapper', '3.3.0'
#    pod 'Moya-ObjectMapper/RxSwift', '2.6'
    # pod 'SwiftyJSON', '4.1.0’
    
    # Then语法糖
    pod 'Then', '2.4.0'
    
    # 页面布局
    pod 'SnapKit', '4.2.0’

    # 下载图片
    pod 'Kingfisher', '4.10.0’

    # SDCycleScrollView,LLCycleScrollView 无限循环图片、文字轮播器
#     pod 'FSPagerView', '~> 0.8.1'
    # Segmentio 用Swift编写的动画顶部/底部分段控制
    
    # 键盘弹出防止txt被遮挡
#    pod 'IQKeyboardManagerSwift'

    # 空状态模式
    # pod 'DZNEmptyDataSet', '1.8.1’

    # 导航
    # pod 'URLNavigator', '2.0.4'
    pod 'ESTabBarController-swift', '2.6.3'
    
    # 在状态栏显示FPS
    pod 'GDPerformanceView-Swift', '~> 1.3.2'

    # 加载内容页
#    pod 'SkeletonView', '1.2.1'

    # 皮肤
    # pod 'SwiftTheme', '0.4.1'
    pod 'Hue', '3.0.1'

    # 依赖注入框架
    pod 'Swinject', '2.4.1'

    # 信息提示
    pod 'SwiftMessages', '6.0.0'
    pod 'NVActivityIndicatorView', '4.4.0'
    
    # 数据持久化
    pod 'SwiftyUserDefaults', '4.0.0-alpha.1'
    
    # 日志
    pod 'XCGLogger', '6.0.4'

#  target 'YYImproveTests' do
#    inherit! :search_paths
#    # Pods for testing
#    pod 'RxBlocking', '4.3.1'
#    pod 'RxTest',     '4.3.1'
#  end
#
#  target 'YYImproveUITests' do
#    inherit! :search_paths
#    # Pods for testing
#    pod 'RxBlocking', '4.3.1'
#    pod 'RxTest',     '4.3.1'
#  end

end
