import SwiftUI

public extension Color {
    /// A color of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    init<ThemeProfile: Theme>(_ asset: ThemeProfile.Asset.ColorAsset, appearance: PreferredAppearance?, theme: ThemeProfile?) {
        self = ThemeProvider.shared.color(for: asset, preferredAppearance: appearance, on: theme)
    }
}
