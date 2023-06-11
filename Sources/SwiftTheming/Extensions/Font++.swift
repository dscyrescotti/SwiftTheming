import SwiftUI

public extension Font {
    /// A font of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    init<ThemeCategory: Themes>(asset: ThemeCategory.Asset.FontAsset, appearance: PreferredAppearance?, theme: ThemeCategory?) {
        self = ThemeProvider.shared.font(for: asset, preferredAppearance: appearance, on: theme)
    }
}
