import SwiftUI

extension UserDefaults {
    static func get<T: Codable>(_ type: T.Type, key: Key) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key.rawValue), let value = try? JSONDecoder().decode(T.self, from: data) else { return nil }
        return value
    }
    
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
    
    enum Key: String {
        case theme = "theming.theme.key"
        case preferredAppearance = "theming.preferredAppearance.key"
    }
}
