import SwiftUI

import ComposableArchitecture

import RootFeature

@main
struct PetalkApp: App {
    var body: some Scene {
        WindowGroup {
            RootFeatureView()
                .onOpenURL(perform: { url in
                    //                AppService.openURL(url)
                    
                })
        }
    }
}
