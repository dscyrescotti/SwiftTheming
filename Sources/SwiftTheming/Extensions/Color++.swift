import SwiftUI

public extension Color {
    /// A color of a given asset.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset) {
        self = themeProvider.color(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A color of a given asset that allows to override the preferred appearance.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance?) {
        self = themeProvider.color(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A color of a given asset that allows to override the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset, theme: Theme?) {
        self = themeProvider.color(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A color of a given asset that allows to override the preferred appearance and the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance?, theme: Theme?) {
        self = themeProvider.color(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
}
