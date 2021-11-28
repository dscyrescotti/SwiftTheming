import SwiftUI

public extension Font {
    /// A font of a given asset.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.FontAsset) {
        self = themeProvider.font(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A font of a given asset that allows to override the preferred appearance.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance?) {
        self = themeProvider.font(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A font of a given asset that allows to override the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.FontAsset, theme: Theme?) {
        self = themeProvider.font(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A font of a given asset that allows to override the preferred appearance and the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance?, theme: Theme?) {
        self = themeProvider.font(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
}
