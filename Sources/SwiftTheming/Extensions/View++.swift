import SwiftUI

extension View {
    /// A modifier that registers defined themes for further use and takes default theme and preferred appearance for first time running.
    /// - Parameters:
    ///   - defaultTheme: default theme for first time running
    ///   - preferredAppearance: preferred appearance for first time running
    /// - Returns: view
    public func themeProviding(defaultTheme: Theme, defaultAppearance: PreferredAppearance = .system) -> some View {
        self.modifier(ThemeProvidingViewModifier(defaultTheme: defaultTheme, defaultAppearance: defaultAppearance))
    }
    
    public func preferredAppearance(_ appearance: PreferredAppearance?) -> some View {
        self.environment(\.preferredAppearance, appearance)
    }
    
    public func preferredTheme(_ theme: Theme?) -> some View {
        self.environment(\.preferredTheme, theme)
    }
}


extension View {
    // MARK: - background color
    /// A background color of a given asset.
    @ViewBuilder
    public func background(on themeProvider: ThemeProvider, for asset: ColorAssetable) -> some View {
        self.background(Color(on: themeProvider, for: asset))
    }
    
    /// A background color of a given asset that allows to override the preferred appearance.
    @ViewBuilder
    public func background(on themeProvider: ThemeProvider, for asset: ColorAssetable, preferredAppearance: PreferredAppearance?) -> some View {
        self.background(Color(on: themeProvider, for: asset, preferredAppearance: preferredAppearance))
    }
    
    /// A background color of a given asset that allows to override the current theme optionally.
    @ViewBuilder
    public func background(on themeProvider: ThemeProvider, for asset: ColorAssetable, theme: Theme?) -> some View {
        self.background(Color(on: themeProvider, for: asset, theme: theme))
    }
    
    /// A background color of a given asset that allows to override the preferred appearance and the current theme optionally.
    @ViewBuilder
    public func background(on themeProvider: ThemeProvider, for asset: ColorAssetable, preferredAppearance: PreferredAppearance?, theme: Theme?) -> some View {
        self.background(Color(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme))
    }
    
    // MARK: - foreground color
    /// A foreground color of the given asset.
    public func foregroundColor(on themeProvider: ThemeProvider, for asset: ColorAssetable) -> some View {
        self.foregroundColor(Color(on: themeProvider, for: asset))
    }
    
    /// A foreground color of a given asset that allows to override the preferred appearance.
    public func foregroundColor(on themeProvider: ThemeProvider, for asset: ColorAssetable, preferredAppearance: PreferredAppearance?) -> some View {
        self.foregroundColor(Color(on: themeProvider, for: asset, preferredAppearance: preferredAppearance))
    }
    
    /// A foreground color of a given asset that allows to override the current theme optionally.
    public func foregroundColor(on themeProvider: ThemeProvider, for asset: ColorAssetable, theme: Theme?) -> some View {
        self.foregroundColor(Color(on: themeProvider, for: asset, theme: theme))
    }
    
    /// A foreground color of a given asset that allows to override the preferred appearance and the current theme optionally.
    public func foregroundColor(on themeProvider: ThemeProvider, for asset: ColorAssetable, preferredAppearance: PreferredAppearance?, theme: Theme?) -> some View {
        self.foregroundColor(Color(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme))
    }
}

extension View where Self == Text {
    // MARK: - text font
    /// A font of a given asset.
    public func font(on themeProvider: ThemeProvider, for asset: FontAssetable) -> Text {
        self.font(Font(on: themeProvider, for: asset))
    }
    
    /// A font of a given asset that allows to override the preferred appearance.
    public func font(on themeProvider: ThemeProvider, for asset: FontAssetable, preferredAppearance: PreferredAppearance?) -> Text {
        self.font(Font(on: themeProvider, for: asset, preferredAppearance: preferredAppearance))
    }
    
    /// A font of a given asset that allows to override the current theme optionally.
    public func font(on themeProvider: ThemeProvider, for asset: FontAssetable, theme: Theme?) -> Text {
        self.font(Font(on: themeProvider, for: asset, theme: theme))
    }
    
    /// A font of a given asset that allows to override the preferred appearance and the current theme optionally.
    public func font(on themeProvider: ThemeProvider, for asset: FontAssetable, preferredAppearance: PreferredAppearance?, theme: Theme?) -> Text {
        self.font(Font(on: themeProvider, for: asset, preferredAppearance: preferredAppearance, theme: theme))
    }
}
