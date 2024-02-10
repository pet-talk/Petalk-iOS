import SwiftUI

import ComposableArchitecture
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
        loginButton(type: .kakao)
        loginButton(type: .naver)
        loginButton(type: .apple)
      })
      .padding(.horizontal, 24)
      
      Spacer(minLength: 100)
    })
    .task {
      await send(.onAppear)
        .finish()
    }
  }
  
  func loginButton(type: LoginType) -> some View {
    HStack(alignment: .center, content: {
      Image(asset: type.icon)
        .frame(width: 20, height: 20, alignment: .top)
      Spacer()
      Text("\(type.title)로 시작하기")
      Spacer()
    })
    .onTapGesture {
      print("\(type.title)로 로그인")
    }
    .padding(.horizontal, 24)
    .frame(maxWidth: .infinity)
    .frame(height: 55)
    .background(type.backgroundColor)
    .foregroundStyle(type.foregroundColor)
    .clipShape(.rect(cornerRadius: 10))
  }
}

// MARK: - Preview

#Preview {
  OnboardingFeatureView(
    store: .init(
      initialState: .init(),
      reducer: {
        OnboardingFeature()
      }
    )
  )
}

extension OnboardingFeatureView {
  enum LoginType: CaseIterable {
    case kakao
    case naver
    case apple
    
    var title: String {
      switch self {
      case .kakao:
        return "카카오"
      case .naver:
        return "네이버"
      case .apple:
        return "Apple"
      }
    }
    
    var icon: DesignSystemImages {
      switch self {
      case .kakao:
        return R.Assets.kakaoSymbol
      case .naver:
        return R.Assets.naverSymbol
      case .apple:
        return R.Assets.appleSymbol
      }
    }
    
    var backgroundColor: Color {
      switch self {
      case .kakao:
        return R.Colors.bgKakao.swiftUIColor
      case .naver:
        return R.Colors.bgNaver.swiftUIColor
      case .apple:
        return R.Colors.textDark900.swiftUIColor
      }
    }
    
    var foregroundColor: Color {
      switch self {
      case .kakao:
        return R.Colors.textDark900.swiftUIColor
      case .naver, .apple:
        return R.Colors.textWhite.swiftUIColor
      }
    }
  }
}
