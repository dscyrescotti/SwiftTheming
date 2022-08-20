import SwiftUI

public extension Gradient {
    /// A gradient of a given asset.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable) {
        self = themeProvider.gradient(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A gradient of a given asset that allows to override the preferred appearance.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, preferredAppearance: PreferredAppearance?) {
        self = themeProvider.gradient(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A gradient of a given asset that allows to override the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, theme: Theme?) {
        self = themeProvider.gradient(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A gradient of a given asset that allows to override the preferred appearance and the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, preferredAppearance: PreferredAppearance?, theme: Theme?) {
        self = themeProvider.gradient(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
}

// MARK: - LinearGradient
extension LinearGradient {
    /// A linear gradient of a given asset.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(on: themeProvider, for: asset), startPoint: startPoint, endPoint: endPoint)
    }
    
    /// A linear gradient of a given asset that allows to override the preferred appearance.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, preferredAppearance: PreferredAppearance?, startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, preferredAppearance: preferredAppearance), startPoint: startPoint, endPoint: endPoint)
    }
    
    /// A linear gradient of a given asset that allows to override the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, theme: Theme?, startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, theme: theme), startPoint: startPoint, endPoint: endPoint)
    }
    
    /// A linear gradient of a given asset that allows to override the preferred appearance and the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, preferredAppearance: PreferredAppearance?, theme: Theme?, startPoint: UnitPoint, endPoint: UnitPoint) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme), startPoint: startPoint, endPoint: endPoint)
    }
}

// MARK: - RadialGradient
extension RadialGradient {
    /// A radial gradient of a given asset.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(on: themeProvider, for: asset), center: center, startRadius: startRadius, endRadius: endRadius)
    }
    
    /// A radial gradient of a given asset that allows to override the preferred appearance.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, preferredAppearance: PreferredAppearance?, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, preferredAppearance: preferredAppearance), center: center, startRadius: startRadius, endRadius: endRadius)
    }
    
    /// A radial gradient of a given asset that allows to override the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, theme: Theme?, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, theme: theme), center: center, startRadius: startRadius, endRadius: endRadius)
    }
    
    /// A radial gradient of a given asset that allows to override the preferred appearance and the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: GradientAssetable, preferredAppearance: PreferredAppearance?, theme: Theme?, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) {
        self.init(gradient: Gradient(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme), center: center, startRadius: startRadius, endRadius: endRadius)
    }
}
