import Foundation

@propertyWrapper
public struct UserDefault<T> {
    let key: UserDefaultClient.Key
    let defaultValue: T?
    let storage: UserDefaults
    
    public var wrappedValue: T? {
        get {
            self.storage.object(forKey: key.rawValue) as? T ?? self.defaultValue
        }
        set {
            self.storage.set(newValue, forKey: key.rawValue)
        }
    }
    
    public init(key: UserDefaultClient.Key, defaultValue: T? = nil, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
}
