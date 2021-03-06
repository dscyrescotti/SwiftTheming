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

// MARK: - LinearGradient
extension LinearGradient {
    /// A linear gradient of a given asset.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(on: themeProvider, for: asset), startPoint: startPoint, endPoint: endPoint)
    }
    
    /// A linear gradient of a given asset that allows to override the preferred appearance.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance?, startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, preferredAppearance: preferredAppearance), startPoint: startPoint, endPoint: endPoint)
    }
    
    /// A linear gradient of a given asset that allows to override the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, theme: Theme?, startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, theme: theme), startPoint: startPoint, endPoint: endPoint)
    }
    
    /// A linear gradient of a given asset that allows to override the preferred appearance and the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance?, theme: Theme?, startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme), startPoint: startPoint, endPoint: endPoint)
    }
}

// MARK: - RadialGradient
extension RadialGradient {
    /// A radial gradient of a given asset.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(on: themeProvider, for: asset), center: center, startRadius: startRadius, endRadius: endRadius)
    }
    
    /// A radial gradient of a given asset that allows to override the preferred appearance.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance?, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, preferredAppearance: preferredAppearance), center: center, startRadius: startRadius, endRadius: endRadius)
    }
    
    /// A radial gradient of a given asset that allows to override the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, theme: Theme?, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, theme: theme), center: center, startRadius: startRadius, endRadius: endRadius)
    }
    
    /// A radial gradient of a given asset that allows to override the preferred appearance and the current theme optionally.
    init<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance?, theme: Theme?, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme), center: center, startRadius: startRadius, endRadius: endRadius)
    }
}
