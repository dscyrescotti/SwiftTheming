import SwiftUI

public extension Image {
    /// An image of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    init<ThemeProfile: Theme>(_ asset: ThemeProfile.Asset.ImageAsset, appearance: PreferredAppearance?, theme: ThemeProfile?) {
        self = ThemeProvider.shared.image(for: asset, preferredAppearance: appearance, on: theme)
    }
}

extension Image {
    #if os(macOS)
    static var empty: Image = Image(nsImage: NSImage())
    #else
    static var empty: Image = Image(uiImage: UIImage())
    #endif
}
