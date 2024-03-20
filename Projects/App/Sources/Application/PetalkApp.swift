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
                    initialState: RootFeature.State(),
                    reducer: {
                        RootFeature()
                    }, withDependencies: {
                        $0.authClient = .testValue
                    }
                )
            )
            .onOpenURL(perform: { url in
                socialLogin.openURL(url)
            })
        }
    }
}
