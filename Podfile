source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

inhibit_all_warnings!   # 去除第三方的警告
use_frameworks!         # 修改引入方式，加了这句引入使用#import””;未加使用#import <>

target 'YYImprove' do

    # 基于Alamofire的网络抽象层
    pod 'Moya', '11.0.2’
    pod 'Moya/RxSwift', '11.0.2'
    pod 'RxSwift', '4.1.2'
    pod 'Alamofire', '4.7.2’

    # JSON 解析
    pod 'ObjectMapper', '3.1.0'
    # pod 'SwiftyJSON', '4.1.0’
    
    # 页面布局
    pod 'SnapKit', '4.0.0’

    # 下载图片
    pod 'Kingfisher', '4.7.0’

    # SDCycleScrollView,LLCycleScrollView 无限循环图片、文字轮播器
    # Segmentio 用Swift编写的动画顶部/底部分段控制

    # 空状态模式
    # pod 'DZNEmptyDataSet', '1.8.1’

    # 导航
    # pod 'URLNavigator', '2.0.4'
    pod 'ESTabBarController-swift', '2.6.2'

    # 加载内容页
    pod 'SkeletonView', '1.1.1'

    # 皮肤
    # pod 'SwiftTheme', '0.4.1'
    pod 'Hue', '3.0.1'

    # 依赖注入框架
    pod 'Swinject', '2.4.0'

    # 信息提示
    pod 'SwiftMessages', '4.1.2'
    
    # 数据持久化
    pod 'SwiftyUserDefaults', '4.0.0-alpha.1'
    
    # 日志
    pod 'XCGLogger', '6.0.2'

  target 'YYImproveTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'YYImproveUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
