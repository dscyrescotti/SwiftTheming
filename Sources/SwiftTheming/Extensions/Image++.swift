import SwiftUI

extension Image {
    /// An image of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    public init(_ asset: ImageAssetable, appearance: PreferredAppearance? = nil, theme: Theme? = nil) {
        self = ThemeProvider.shared.image(for: asset, preferredAppearance: appearance, on: theme)
    }
}
