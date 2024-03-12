import SwiftUI

import ComposableArchitecture

import CustomReviewFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, CustomReviewFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    CustomReviewFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                CustomReviewFeature()
            }
        )
    )
}