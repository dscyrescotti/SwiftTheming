import SwiftUI

extension Font {
    /// A font of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    public init(_ asset: FontAssetable, appearance: PreferredAppearance? = nil, theme: Theme? = nil) {
        self = ThemeProvider.shared.font(for: asset, preferredAppearance: appearance, on: theme)
    }
}
