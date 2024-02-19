import SwiftUI
import ComposableArchitecture

import RootFeature
import OnboardingFeature

@main
struct PetalkApp: App {
    var body: some Scene {
        WindowGroup {
            RootFeatureView(
                store: .init(
                    initialState: .init(),
                    reducer: {
                        RootFeature()
                    }
                )
            )
            .onOpenURL(perform: { url in
//                AppService.openURL(url)
                
            })
        }
    }
}
