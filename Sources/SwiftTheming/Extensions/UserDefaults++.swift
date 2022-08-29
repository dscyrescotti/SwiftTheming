import SwiftUI

public extension UserDefaults {
    /// A method that fetch data based on requested data type and key.
    static func get<T: Codable>(_ type: T.Type, key: Key) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key.rawValue), let value = try? JSONDecoder().decode(T.self, from: data) else { return nil }
        return value
    }
    
    /// A method that store data based on requested data type and key.
    static func set<T: Codable>(_ value: T, key: Key) {
        do {
            let data = try JSONEncoder().encode(value)
            UserDefaults.standard.set(data, forKey: key.rawValue)
            UserDefaults.standard.synchronize()
        } catch {
            #if DEBUG
            debugPrint(error.localizedDescription)
            #endif
        }
    }
    
    /// A list of keys to be used to store and fetch theme and appearance.
    enum Key: String {
        /// A key for theme to store and fetch in user defaults.
        case theme = "theming.theme.key"
        /// A key for preferred appearance to store and fetch in user defaults.
        case preferredAppearance = "theming.preferredAppearance.key"
    }
}
