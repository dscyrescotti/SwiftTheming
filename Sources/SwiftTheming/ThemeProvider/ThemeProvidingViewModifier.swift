import SwiftUI

/// A view modifier that sets up theme provider to be able to used across view hierarchy.
struct ThemeProvidingViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var themeProvider: ThemeProvider
    @State private var preferredColorScheme: ColorScheme?

    func body(content: Content) -> some View {
        content
            .preferredColorScheme(preferredColorScheme)
            .onAppear {
                themeProvider.changeColorScheme(with: colorScheme)
            }
            .onChange(of: colorScheme) { colorScheme in
                themeProvider.changeColorScheme(with: colorScheme)
            }
            .onReceive(themeProvider.$preferredAppearance, perform: { appearance in
                switch appearance {
                case .system: preferredColorScheme = nil
                case .light: preferredColorScheme = .light
                case .dark: preferredColorScheme = .dark
                }
            })
            .environmentObject(themeProvider)
    }

    /// An initializer that takes default theme and preferred appearance for first time running.
    /// - Parameters:
    ///   - theme: default theme for first time running
    ///   - preferredAppearance: preferred appearance for first time running
    init<ThemeCategory: Themes>(_ theme: ThemeCategory, preferredAppearance: PreferredAppearance) {
        self._themeProvider = ObservedObject(initialValue: ThemeProvider(theme, preferredAppearance))
    }
}
