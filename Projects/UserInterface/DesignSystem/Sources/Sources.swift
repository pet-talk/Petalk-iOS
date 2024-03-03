import SwiftUI

// swiftlint: disable type_name
//public typealias R = DesignSystemAsset

//public extension Color {
//  typealias Colors = DesignSystemAsset.Colors
//}

// R.Assets.logo.swiftUIImage
// R.PetTalkIcon.iconAbnormal.image

public extension Image {
    static func R(_ image: DesignSystemImages) -> Image {
        image.swiftUIImage
    }
}

func test() {
//    let image: Image = .R()
}
