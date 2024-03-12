import Foundation

@propertyWrapper
public struct UserDefault<T> {
    let key: String
    let defaultValue: T?
    let storage: UserDefaults
    
    public var wrappedValue: T? {
        get {
            self.storage.object(forKey: key) as? T ?? self.defaultValue
        }
        set {
            self.storage.set(newValue, forKey: key)
        }
    }
    
    public init(key: String, defaultValue: T? = nil, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
}
