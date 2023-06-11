import SwiftUI

public extension Color {
    /// A color of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    init<ThemeCategory: Themes>(asset: ThemeCategory.Asset.ColorAsset, appearance: PreferredAppearance?, theme: ThemeCategory?) {
        self = ThemeProvider.shared.color(for: asset, preferredAppearance: appearance, on: theme)
    }
}
