import SwiftUI

public extension Image {
    /// An image of a given asset.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ImageAsset) {
        self = themeProvider.image(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// An image of a given asset that allows to override the preferred appearance.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance?) {
        self = themeProvider.image(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// An image of a given asset that allows to override the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ImageAsset, theme: Theme?) {
        self = themeProvider.image(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// An image of a given asset that allows to override the preferred appearance and the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance?, theme: Theme?) {
        self = themeProvider.image(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
}
