import SwiftUI

import DesignSystem

public enum Tab {}

extension Tab {
    public enum PetOwner: Hashable {
        case home
        case search
        case consulting
        case myPage
    }
    
    public enum Veterinarian: Hashable {
        case home
        case customerReview
        case consultationList
        case myPage
    }
}

public extension Tab.PetOwner {
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .search:
            return "검색하기"
        case .consulting:
            return "상담하기"
        case .myPage:
            return "마이페이지"
        }
    }
    
    var icon: Image {
        switch self {
        case .home:
            return R.Assets.iconHome
        case .search:
            return R.Assets.iconSearch
        case .consulting:
            return R.Assets.iconMessage
        case .myPage:
            return R.Assets.iconMypage
        }
    }
}
