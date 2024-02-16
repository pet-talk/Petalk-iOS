import SwiftUI
import ComposableArchitecture

import OnboardingFeature

@main
struct PetalkApp: App {
    
    var body: some Scene {
        WindowGroup {
            OnboardingFeatureView(
                store: .init(
                    initialState: .init(),
                    reducer: {
                        OnboardingFeature()
                    }
                )
            )
            .onOpenURL(perform: { url in
//                AppService.openURL(url)
                
            })
        }
    }
}
