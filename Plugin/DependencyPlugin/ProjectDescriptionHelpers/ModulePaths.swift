import Foundation

// swiftlint: disable all
public enum ModulePaths {
    case feature(Feature)
    case domain(Domain)
    case core(Core)
    case userInterface(UserInterface)
    case shared(Shared)
}

extension ModulePaths: MicroTargetPathConvertable {
    public func targetName(type: MicroTargetType) -> String {
        switch self {
        case let .feature(module as any MicroTargetPathConvertable),
            let .domain(module as any MicroTargetPathConvertable),
            let .core(module as any MicroTargetPathConvertable),
            let .userInterface(module as any MicroTargetPathConvertable),
            let .shared(module as any MicroTargetPathConvertable):
            return module.targetName(type: type)
        }
    }
}

public extension ModulePaths {
    enum Feature: String, MicroTargetPathConvertable {
        case SplashFeature
        case VetMainTabFeature
        case MyPageFeature
        case ConsultationListFeature
        case CustomerReviewFeature
        case ConsultingFeature
        case SearchFeature
        case RootFeature
        case HomeFeature
        case PetParentMainTabFeature
        case OnboardingFeature
        case BaseFeature   
    }
}

public extension ModulePaths {
    enum Domain: String, MicroTargetPathConvertable {
        case AuthDomain
        case BaseDomain
    }
}

public extension ModulePaths {
    enum Core: String, MicroTargetPathConvertable {
        case UserDefault
        case Networking
        
    }
}

public extension ModulePaths {
    enum UserInterface: String, MicroTargetPathConvertable {
        case DesignSystem
    }
}

public extension ModulePaths {
    enum Shared: String, MicroTargetPathConvertable {
        case Logger
        case FoundationUtility
        case SwiftUIUtility
        case CombineUtility
        case ThirdParty
        
    }
}

public enum MicroTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
    case unitTest = "Tests"
    case demo = "Demo"
}

public protocol MicroTargetPathConvertable {
    func targetName(type: MicroTargetType) -> String
}

public extension MicroTargetPathConvertable where Self: RawRepresentable {
    func targetName(type: MicroTargetType) -> String {
        "\(self.rawValue)\(type.rawValue)"
    }
}
