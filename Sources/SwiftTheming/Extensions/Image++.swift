import SwiftUI

public extension Image {
    /// An image of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    init<ThemeCategory: Themes>(asset: ThemeCategory.Asset.ImageAsset, appearance: PreferredAppearance?, theme: ThemeCategory?) {
        self = ThemeProvider.shared.image(for: asset, preferredAppearance: appearance, on: theme)
    }
}
