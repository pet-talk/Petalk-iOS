import SwiftUI

import ComposableArchitecture

import MyPageFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, MyPageFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    MyPageFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                MyPageFeature()
            }
        )
    )
}