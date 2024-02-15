import Foundation

//import KakaoSDKCommon
//import KakaoSDKAuth
//import NaverThirdPartyLogin

import FoundationUtility

struct AppService {
    private static let appName: String = Bundle.main.value(for: "CFBundleName")
    private static let kakaoAppKey: String = Bundle.main.value(for: "KakaoAppKey")
    private static let naverClientKey: String = Bundle.main.value(for: "NaverClientKey")
    private static let naverClientSecret: String = Bundle.main.value(for: "NaverClientSecret")
    
    static func initialize() {
//        KakaoSDK.initSDK(appKey: kakaoAppKey)
        initNaverThirdPartyLogin()
    }
    
    static func openURL(_ url: URL) {
//        if AuthApi.isKakaoTalkLoginUrl(url) {
//            _ = AuthController.handleOpenUrl(url: url)
//            return
//        }
    }
    
    private static func initNaverThirdPartyLogin() {
//        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
//        // 네이버 앱으로 인증하는 방식 활성화
//        instance?.isNaverAppOauthEnable = true
//        // SafariViewController에서 인증하는 방식 활성화
//        instance?.isInAppOauthEnable = true
//        // 인증 화면을 아이폰의 세로모드에서만 적용
//        instance?.isOnlyPortraitSupportedInIphone()
//        
//        instance?.serviceUrlScheme = "naverlogin"
//        instance?.consumerKey = naverClientKey
//        instance?.consumerSecret = naverClientSecret
//        instance?.appName = appName
    }
}
