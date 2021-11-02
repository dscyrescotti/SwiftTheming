import SwiftUI

extension View {
    public func themeProviding<Theme: Themeable>(defaultTheme: Theme, defaultAppearance: PreferredAppearance = .system) -> some View {
        self.modifier(ThemeProvidingViewModifier(defaultTheme: defaultTheme, defaultAppearance: defaultAppearance))
    }
}
