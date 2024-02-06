import ProjectDescription

public typealias DEP = TargetDependency

public extension DEP {
    struct SPM {
        public static let ComposableArchitecture: DEP = .external(name: "ComposableArchitecture", condition: nil)
        public static let KakaoSDK: DEP = .external(name: "KakaoSDK", condition: nil)
        public static let NaverSDK: DEP = .external(name: "NaverSDK", condition: nil)
        public static let SDWebImageSwiftUI: DEP = .external(name: "SDWebImageSwiftUI", condition: nil)
    }
}

public extension Package {
    struct SPM {
        public static let allCases: [Package] = [
            ComposableArchitecture, KakaoSDK, NaverSDK, SDWebImageSwiftUI
        ]
        
        public static let ComposableArchitecture: Package = .remote(url: "https://github.com/pointfreeco/swift-composable-architecture", requirement: .branch("main"))
        public static let KakaoSDK: Package = .remote(url: "https://github.com/kakao/kakao-ios-sdk", requirement: .branch("master"))
        public static let NaverSDK: Package = .remote(url: "https://github.com/SH-OH/naveridlogin-sdk-ios.git", requirement: .branch("master"))
        public static let SDWebImageSwiftUI: Package = .remote(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", requirement: .upToNextMajor(from: "2.0.0"))
    }
}
