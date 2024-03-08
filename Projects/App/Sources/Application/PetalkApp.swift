import SwiftUI

import ComposableArchitecture

import RootFeature
import AuthDomain

@main
struct PetalkApp: App {
    @Dependency(\.authClient.socialLogin) var socialLogin
    
    var body: some Scene {
        WindowGroup {
            RootFeatureView()
                .onOpenURL(perform: { url in
                    socialLogin.openURL(url: url)
                })
        }
    }
}
