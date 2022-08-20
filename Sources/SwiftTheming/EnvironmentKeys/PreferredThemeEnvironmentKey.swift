import SwiftUI

struct PreferredThemeEnvironmentKey: EnvironmentKey {
    static var defaultValue: Theme? = nil
}

public extension EnvironmentValues {
    var preferredTheme: Theme? {
        get { self[PreferredThemeEnvironmentKey.self] }
        set { self[PreferredThemeEnvironmentKey.self] = newValue }
    }
}

