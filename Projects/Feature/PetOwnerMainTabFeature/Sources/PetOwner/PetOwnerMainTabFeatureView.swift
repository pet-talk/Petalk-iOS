import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

public struct PetOwnerMainTabFeatureView: View {
    public let store: StoreOf<PetOwnerMainTabFeature>
    
    public init(store: StoreOf<PetOwnerMainTabFeature>) {
        self.store = store
    }
    
    public var body: some View {
//        TabView(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/,
//                content:  {
//            Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
//            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
//        })
        List {
            Text("Hello, RootFeature!")
        }
        .task {
//            await send(.onAppear)
//                .finish()
        }
    }
}
