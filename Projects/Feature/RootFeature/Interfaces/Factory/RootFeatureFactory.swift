import SwiftUI

public protocol RootFeatureFactory {
    func makeView() -> any View
}
