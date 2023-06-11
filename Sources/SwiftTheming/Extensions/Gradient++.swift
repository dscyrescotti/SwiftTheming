import SwiftUI

public extension Gradient {
    /// A gradient of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for gradient
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    init<ThemeProfile: Theme>(_ asset: ThemeProfile.Asset.GradientAsset, appearance: PreferredAppearance?, theme: ThemeProfile?) {
        self = ThemeProvider.shared.gradient(for: asset, preferredAppearance: appearance, on: theme)
    }
}
