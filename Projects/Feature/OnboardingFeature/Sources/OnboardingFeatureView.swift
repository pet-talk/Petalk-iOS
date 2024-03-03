import SwiftUI

import ComposableArchitecture

import AuthDomainInterface
import DesignSystem

// MARK: - View

@ViewAction(for: OnboardingFeature.self)
public struct OnboardingFeatureView: View {
    public let store: StoreOf<OnboardingFeature>
    
    public init(store: StoreOf<OnboardingFeature>) {
        self.store = store
    }
    
    public var body: some View {
        VStack(alignment: .center, content: {
            Spacer()
            Image(asset: R.Assets.logo)
            Spacer()
            
            VStack(spacing: 8, content: {
                loginButton(loginMethod: .kakao)
                loginButton(loginMethod: .naver)
                loginButton(loginMethod: .apple)
            })
            .padding(.horizontal, 24)
            .padding(.bottom, 100)
        })
    }
    
    private func loginButton(loginMethod: SocialLoginMethod) -> some View {
        HStack(alignment: .center, content: {
            Image(asset: loginMethod.icon)
                .frame(width: 20, height: 20, alignment: .top)
            Spacer()
            Text("\(loginMethod.title)로 시작하기")
            Spacer()
        })
        .onTapGesture {
            send(.loginButtonTapped)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .frame(height: 55)
        .background(loginMethod.backgroundColor)
        .foregroundStyle(loginMethod.foregroundColor)
        .clipShape(.rect(cornerRadius: 10))
    }
}

extension SocialLoginMethod {
    fileprivate var title: String {
        switch self {
        case .kakao:
            return "카카오"
        case .naver:
            return "네이버"
        case .apple:
            return "Apple"
        }
    }
    
    fileprivate var icon: DesignSystemImages {
        switch self {
        case .kakao:
            return R.Assets.kakaoSymbol
        case .naver:
            return R.Assets.naverSymbol
        case .apple:
            return R.Assets.appleSymbol
        }
    }
    
    fileprivate var backgroundColor: Color {
        switch self {
        case .kakao:
            return R.Colors.bgKakao.swiftUIColor
        case .naver:
            return R.Colors.bgNaver.swiftUIColor
        case .apple:
            return R.Colors.textDark900.swiftUIColor
        }
    }
    
    fileprivate var foregroundColor: Color {
        switch self {
        case .kakao:
            return R.Colors.textDark900.swiftUIColor
        case .naver, .apple:
            return R.Colors.textWhite.swiftUIColor
        }
    }
}
