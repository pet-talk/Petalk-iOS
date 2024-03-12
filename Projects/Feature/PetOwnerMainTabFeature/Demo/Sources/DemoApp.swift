import SwiftUI

import ComposableArchitecture

import MainTabFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, MainTabFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    MainTabFeatureView(
        store: .init(
            initialState: .init(
                user: .init(
                    userId: "preview_userId_1",
                    nickname: "preview_nickname_1",
                    userAuthority: .petOwner
                )
            ),
            reducer: {
                MainTabFeature()
            }
        )
    )
}
