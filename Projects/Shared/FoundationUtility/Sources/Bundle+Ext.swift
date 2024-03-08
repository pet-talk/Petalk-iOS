import Foundation

public extension Bundle {
    func string(for key: String) -> String {
        infoDictionary?[key] as? String ?? ""
    }
}
