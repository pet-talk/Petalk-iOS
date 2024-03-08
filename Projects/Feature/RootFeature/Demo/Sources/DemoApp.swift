import SwiftUI

import ComposableArchitecture

import RootFeature

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(
                store: .init(
                    initialState: RootCoordinator.State(),
                    reducer: {
                        RootCoordinator()
                            ._printChanges()
                    }
                )
            )
        }
    }
}

// MARK: - Preview

#Preview {
    RootCoordinatorView(
        store: .init(
            initialState: RootCoordinator.State(routes: .init()),
            reducer: {
                RootCoordinator()
            }
        )
    )
}
