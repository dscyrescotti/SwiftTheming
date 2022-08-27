import SwiftUI

extension View {
    /// A modifier that initiates theme provider and inject view as an environment object. This modifier should be called only once at the top of view hierarchy.
    /// - Returns: view
    public func themeProviding() -> some View {
        self.modifier(ThemeProvidingViewModifier())
    }
}

extension View {
    /// A modifier to set foreground color to view by directly passing color asset.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - appearance: preferred appearance to override current appearance.
    ///   - theme: preferred theme to override current theme
    /// - Returns: view
    public func foregroundColor(
        _ asset: ColorAssetable,
        appearance: PreferredAppearance? = nil,
        theme: Theme? = nil
    ) -> some View {
        foregroundColor(Color(asset, appearance: appearance, theme: theme))
    }
    
    /// A modifier to set background color to view by directly passing color asset.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - appearance: preferred appearance to override current appearance.
    ///   - theme: preferred theme to override current theme.
    /// - Returns: view
    public func background(
        _ asset: ColorAssetable,
        appearance: PreferredAppearance? = nil,
        theme: Theme? = nil
    ) -> some View {
        background(Color(asset, appearance: appearance, theme: theme))
    }
    
    /// A modifier to set font to view by directly passing font asset.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    /// - Returns: view
    public func font(
        _ asset: FontAssetable,
        appearance: PreferredAppearance? = nil,
        theme: Theme? = nil
    ) -> some View {
        font(Font(asset, appearance: appearance, theme: theme))
    }
}

extension View where Self == Text {
    /// A modifier to set font to view by directly passing font asset.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    /// - Returns: text
    public func font(
        _ asset: FontAssetable,
        appearance: PreferredAppearance? = nil,
        theme: Theme? = nil
    ) -> Text {
        font(Font(asset, appearance: appearance, theme: theme))
    }
}
