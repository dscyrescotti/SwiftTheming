import SwiftUI

struct PreferredAppearanceEnvironmentKey: EnvironmentKey {
    static var defaultValue: PreferredAppearance? = nil
}

public extension EnvironmentValues {
    var preferredAppearance: PreferredAppearance? {
        get { self[PreferredAppearanceEnvironmentKey.self] }
        set { self[PreferredAppearanceEnvironmentKey.self] = newValue }
    }
}
