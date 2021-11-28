import SwiftUI

public extension Gradient {
    /// A gradient of a given asset.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset) {
        self = themeProvider.gradient(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A gradient of a given asset that allows to override the preferred appearance.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance?) {
        self = themeProvider.gradient(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A gradient of a given asset that allows to override the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, theme: Theme?) {
        self = themeProvider.gradient(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A gradient of a given asset that allows to override the preferred appearance and the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance?, theme: Theme?) {
        self = themeProvider.gradient(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
}
