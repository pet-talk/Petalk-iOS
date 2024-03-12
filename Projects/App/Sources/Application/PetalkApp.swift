import SwiftUI

import ComposableArchitecture

import RootFeature
import AuthDomain

@main
struct PetalkApp: App {
    @Dependency(\.authClient.socialLogin) var socialLogin
    
    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(
                store: .init(
                    initialState: RootCoordinator.State(),
                    reducer: {
                        RootCoordinator()
                    },
                    withDependencies: {
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
