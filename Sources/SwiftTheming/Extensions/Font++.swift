import SwiftUI

public extension Font {
    /// A font of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    init<ThemeProfile: Theme>(_ asset: ThemeProfile.Asset.FontAsset, appearance: PreferredAppearance?, theme: ThemeProfile?) {
        self = ThemeProvider.shared.font(for: asset, preferredAppearance: appearance, on: theme)
    }
}
