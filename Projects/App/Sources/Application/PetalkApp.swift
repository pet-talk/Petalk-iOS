import SwiftUI
import OnboardingFeature

@main
struct PetalkApp: App {
    
    init() {
        AppService.initialize()
    }
    
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
                AppService.openURL(url)
            })
        }
    }
}
