import SwiftUI

import ComposableArchitecture

import RootFeature
import AuthDomain
import UserDefault

@main
struct PetalkApp: App {
    @Dependency(\.authClient.socialLogin) var socialLogin
    
    var body: some Scene {
        WindowGroup {
            RootFeatureView(
                store: .init(
                    initialState: RootFeature.State.onboarding(.init()),
                    reducer: {
                        RootFeature.onboarding(.init())
                    }, withDependencies: {
                        $0.authClient = .testValue
                        $0.authClient.socialLogin = .testValue
                    }
                )
            )
            .onOpenURL(perform: { url in
                socialLogin.openURL(url: url)
            })
        }
    }
}
