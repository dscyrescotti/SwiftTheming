import SwiftUI

extension View {
    /// A modifier that registers defined themes for further use and takes default theme and preferred appearance for first time running.
    /// - Parameters:
    ///   - defaultTheme: default theme for first time running
    ///   - preferredAppearance: preferred appearance for first time running
    /// - Returns: view
    public func themeProviding<Theme: Themeable>(defaultTheme: Theme, defaultAppearance: PreferredAppearance = .system) -> some View {
        self.modifier(ThemeProvidingViewModifier(defaultTheme: defaultTheme, defaultAppearance: defaultAppearance))
    }
}


extension View {
    // MARK: - background color
    /// A background color of a given asset.
    @ViewBuilder
    public func background<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset) -> some View {
        self.background(Color(on: themeProvider, for: asset))
    }
    
    /// A background color of a given asset that allows to override the preferred appearance.
    @ViewBuilder
    public func background<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance?) -> some View {
        self.background(Color(on: themeProvider, for: asset, preferredAppearance: preferredAppearance))
    }
    
    /// A background color of a given asset that allows to override the current theme optionally.
    @ViewBuilder
    public func background<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset, theme: Theme?) -> some View {
        self.background(Color(on: themeProvider, for: asset, theme: theme))
    }
    
    /// A background color of a given asset that allows to override the preferred appearance and the current theme optionally.
    @ViewBuilder
    public func background<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance?, theme: Theme?) -> some View {
        self.background(Color(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme))
    }
    
    // MARK: - foreground color
    /// A foreground color of the given asset.
    public func foregroundColor<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset) -> some View {
        self.foregroundColor(Color(on: themeProvider, for: asset))
    }
    
    /// A foreground color of a given asset that allows to override the preferred appearance.
    public func foregroundColor<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance?) -> some View {
        self.foregroundColor(Color(on: themeProvider, for: asset, preferredAppearance: preferredAppearance))
    }
    
    /// A foreground color of a given asset that allows to override the current theme optionally.
    public func foregroundColor<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset, theme: Theme?) -> some View {
        self.foregroundColor(Color(on: themeProvider, for: asset, theme: theme))
    }
    
    /// A foreground color of a given asset that allows to override the preferred appearance and the current theme optionally.
    public func foregroundColor<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance?, theme: Theme?) -> some View {
        self.foregroundColor(Color(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme))
    }
}

extension View where Self == Text {
    // MARK: - text font
    /// A font of a given asset.
    public func font<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.FontAsset) -> Text {
        self.font(Font(on: themeProvider, for: asset))
    }
    
    /// A font of a given asset that allows to override the preferred appearance.
    public func font<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance?) -> Text {
        self.font(Font(on: themeProvider, for: asset, preferredAppearance: preferredAppearance))
    }
    
    /// A font of a given asset that allows to override the current theme optionally.
    public func font<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.FontAsset, theme: Theme?) -> Text {
        self.font(Font(on: themeProvider, for: asset, theme: theme))
    }
    
    /// A font of a given asset that allows to override the preferred appearance and the current theme optionally.
    public func font<Theme: Themeable>(on themeProvider: ThemeProvider<Theme>, for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance?, theme: Theme?) -> Text {
        self.font(Font(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme))
    }
}
