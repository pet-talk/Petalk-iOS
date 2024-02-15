import Foundation

public extension Bundle {
    func value(for key: String) -> String {
        object(forInfoDictionaryKey: key) as? String ?? ""
    }
}
