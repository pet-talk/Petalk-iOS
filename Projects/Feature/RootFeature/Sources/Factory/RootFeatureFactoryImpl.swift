import SwiftUI

import ComposableArchitecture

import RootFeatureInterface

struct RootFeatureFactoryImpl: RootFeatureFactory {
    func makeView() -> any View {
        RootFeatureView()
    }
}
