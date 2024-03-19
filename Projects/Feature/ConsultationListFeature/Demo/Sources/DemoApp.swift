import SwiftUI

import ComposableArchitecture

import ConsultationListFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Text("Hello, ConsultationListFeature!")
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    ConsultationListFeatureView(
        store: .init(
            initialState: .init(),
            reducer: {
                ConsultationListFeature()
            }
        )
    )
}
