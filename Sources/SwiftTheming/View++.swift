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
