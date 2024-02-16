import Foundation
import Combine

import NaverThirdPartyLogin

import ThirdParty
import FoundationUtility

extension SocialLoginMethod {
    fileprivate static let naverClientKey: String = Bundle.main.value(for: "NaverClientKey")
    fileprivate static let naverClientSecret: String = Bundle.main.value(for: "NaverClientSecret")
    
    fileprivate var urlScheme: String {
        switch self {
        case .naver:
            #if DEV
            return "naverlogin"
            #elseif STAGE
            return "naverlogin"
            #else
            return "naverlogin"
            #endif
        case .kakao, .apple:
            return ""
        }
    }
}

final class NaverServiceAdapter {
    private let loginConnection: NaverThirdPartyLoginConnection
    
    init() {
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()!
        
        // 네이버 앱으로 인증하는 방식 활성화
        instance.isNaverAppOauthEnable = true
        // SafariViewController에서 인증하는 방식 활성화
        instance.isInAppOauthEnable = true
        // 인증 화면을 아이폰의 세로모드에서만 적용
        instance.isOnlyPortraitSupportedInIphone()
        
        instance.serviceUrlScheme = SocialLoginMethod.naver.urlScheme
        instance.consumerKey = SocialLoginMethod.naverClientKey
        instance.consumerSecret = SocialLoginMethod.naverClientSecret
//        instance.appName = AppService.appName
        
        loginConnection = instance
//        loginConnection.delegate = self
    }
    
//    func requestLogin() async throws -> SignIn {
////        loginConnection.requestThirdPartyLogin()
//    }
//    
//    func requestMe() async throws -> User {
//        
//    }
//    
//    func requestLogout() async throws {
//        
//    }
}

//extension NaverServiceAdapter: NaverThirdPartyLoginConnectionDelegate {
//    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
//        <#code#>
//    }
//    
//    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
//        <#code#>
//    }
//    
//    func oauth20ConnectionDidFinishDeleteToken() {
//        <#code#>
//    }
//    
//    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
//        <#code#>
//    }
//    
//    func isEqual(_ object: Any?) -> Bool {
//        <#code#>
//    }
//    
//    var hash: Int {
//        <#code#>
//    }
//    
//    var superclass: AnyClass? {
//        <#code#>
//    }
//    
//    func `self`() -> Self {
//        <#code#>
//    }
//    
//    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//    
//    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//    
//    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//    
//    func isProxy() -> Bool {
//        <#code#>
//    }
//    
//    func isKind(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//    
//    func isMember(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//    
//    func conforms(to aProtocol: Protocol) -> Bool {
//        <#code#>
//    }
//    
//    func responds(to aSelector: Selector!) -> Bool {
//        <#code#>
//    }
//    
//    var description: String {
//        <#code#>
//    }
//    
//    
//}
