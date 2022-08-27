import SwiftUI

extension View {
    /// A modifier that registers defined themes for further use and takes default theme and preferred appearance for first time running.
    /// - Parameters:
    ///   - defaultTheme: default theme for first time running
    ///   - preferredAppearance: preferred appearance for first time running
    /// - Returns: view
    public func themeProviding() -> some View {
        self.modifier(ThemeProvidingViewModifier())
    }
}

extension View {
    public func foregroundColor(
        _ asset: ColorAssetable,
        appearance: PreferredAppearance? = nil,
        theme: Theme? = nil
    ) -> some View {
        foregroundColor(Color(asset, appearance: appearance, theme: theme))
    }
    
    public func background(
        _ asset: ColorAssetable,
        appearance: PreferredAppearance? = nil,
        theme: Theme? = nil
    ) -> some View {
        background(Color(asset, appearance: appearance, theme: theme))
    }
    
    public func font(
        _ asset: FontAssetable,
        appearance: PreferredAppearance? = nil,
        theme: Theme? = nil
    ) -> some View {
        font(Font(asset, appearance: appearance, theme: theme))
    }
}

extension View where Self == Text {
    public func font(
        _ asset: FontAssetable,
        appearance: PreferredAppearance? = nil,
        theme: Theme? = nil
    ) -> Text {
        font(Font(asset, appearance: appearance, theme: theme))
    }
}
