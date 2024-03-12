import SwiftUI

import ComposableArchitecture

import ConsultingFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, ConsultingFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    ConsultingFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                ConsultingFeature()
            }
        )
    )
}