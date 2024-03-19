import SwiftUI

import ComposableArchitecture

import BaseFeature
import HomeFeature
import SearchFeature
import ConsultingFeature
import MyPageFeature
import DesignSystem

// MARK: - View

public struct PetOwnerMainTabFeatureView: View {
    @Perception.Bindable
    private var store: StoreOf<PetOwnerMainTabFeature>
    
    public init(store: StoreOf<PetOwnerMainTabFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            TabView(selection: $store.selectedTab.sending(\.tabSelected)) {
                HomeFeatureView(
                    store: store.scope(
                        state: \.home,
                        action: \.home
                    )
                )
                .tabInfo(.home)
                
                SearchFeatureView(
                    store: store.scope(
                        state: \.search,
                        action: \.search
                    )
                )
                .tabInfo(.search)
                
                ConsultingFeatureView(
                    store: store.scope(
                        state: \.consulting,
                        action: \.consulting
                    )
                )
                .tabInfo(.consulting)
                
                MyPageFeatureView(
                    store: store.scope(
                        state: \.myPage,
                        action: \.myPage
                    )
                )
                .tabInfo(.myPage)
            }
            .tint(R.Colors.textPrimary)
        }
    }
}

extension View {
    func tabInfo(_ tab: Tab.PetOwner) -> some View {
        return self
            .tabItem {
                Label(
                    title: { Text(tab.title) },
                    icon: { tab.icon }
                )
            }
            .tag(tab)
    }
}
