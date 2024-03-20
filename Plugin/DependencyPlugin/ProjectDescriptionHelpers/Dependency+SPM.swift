import ProjectDescription

public typealias DEP = TargetDependency

public extension DEP {
    struct SPM {
        public static let ComposableArchitecture: DEP = .external(name: "ComposableArchitecture", condition: nil)
        public static let KakaoSDK: DEP = .external(name: "KakaoSDK", condition: nil)
        public static let NaverThirdPartyLogin: DEP = .external(name: "NaverThirdPartyLogin", condition: nil)
        public static let SDWebImageSwiftUI: DEP = .external(name: "SDWebImageSwiftUI", condition: nil)
        public static let Alamofire: DEP = .external(name: "Alamofire", condition: nil)
    }
}

public extension Package {
    enum SPM: CaseIterable {
        case ComposableArchitecture
        case KakaoSDK
        case NaverThirdPartyLogin
        case SDWebImageSwiftUI
        case Alamofire
        
        public var package: Package {
            switch self {
            case .ComposableArchitecture:
                return .remote(
                    url: "https://github.com/pointfreeco/swift-composable-architecture.git",
                    requirement: .upToNextMajor(
                        from: "1.9.0"
                    )
                )
            case .KakaoSDK:
                return .remote(
                    url: "https://github.com/kakao/kakao-ios-sdk",
                    requirement: .branch(
                        "master"
                    )
                )
            case .NaverThirdPartyLogin:
                return .remote(
                    url: "https://github.com/SH-OH/naveridlogin-sdk-ios.git",
                    requirement: .branch(
                        "master"
                    )
                )
            case .SDWebImageSwiftUI:
                return .remote(
                    url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git",
                    requirement: .upToNextMajor(
                        from: "2.0.0"
                    )
                )
            case .Alamofire:
                return .remote(
                    url: "https://github.com/Alamofire/Alamofire.git",
                    requirement: .upToNextMajor(
                        from: "5.0.0"
                    )
                )
            }
        }
    }
}
