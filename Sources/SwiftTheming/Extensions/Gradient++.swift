import SwiftUI

public extension Gradient {
    /// A gradient of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for gradient
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    init<ThemeCategory: Themes>(asset: ThemeCategory.Asset.GradientAsset, appearance: PreferredAppearance?, theme: ThemeCategory?) {
        self = ThemeProvider.shared.gradient(for: asset, preferredAppearance: appearance, on: theme)
    }
}
