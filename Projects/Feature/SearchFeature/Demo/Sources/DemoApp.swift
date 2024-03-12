import SwiftUI

import ComposableArchitecture

import SearchFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, SearchFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    SearchFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                SearchFeature()
            }
        )
    )
}