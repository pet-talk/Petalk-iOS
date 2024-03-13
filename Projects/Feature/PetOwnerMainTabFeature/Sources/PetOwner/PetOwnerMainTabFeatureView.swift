import SwiftUI

import ComposableArchitecture
import DesignSystem

// MARK: - View

public struct PetOwnerMainTabFeatureView: View {
    @Perception.Bindable var store: StoreOf<PetOwnerMainTabFeature>
    
    public init(store: StoreOf<PetOwnerMainTabFeature>) {
        self.store = store
    }
    
    public var body: some View {
        TabView(selection: $store.selectedTab.sending(\.selectTab), content: {
            NavigationView(content: {
                NavigationLink(destination: Text("Destination")) { /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
            })
        })
    }
}
