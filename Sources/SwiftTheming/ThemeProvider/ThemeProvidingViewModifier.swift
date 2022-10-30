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
                case .automatic:
                    switch themeProvider.solarPeriod {
                    case .day: preferredColorScheme = .light
                    case .night: preferredColorScheme = .dark
                    }
                }
            })
            .onReceive(themeProvider.$solarPeriod, perform: { period in
                if themeProvider.preferredAppearance == .automatic {
                    switch period {
                    case .day: preferredColorScheme = .light
                    case .night: preferredColorScheme = .dark
                    }
                }
            })
            .environmentObject(themeProvider)
    }
    
    /// An initializer that takes default theme and preferred appearance for first time running.
    /// - Parameters:
    ///   - defaultTheme: default theme for first time running
    ///   - defaultAppearance: preferred appearance for first time running
    init() {
        self._themeProvider = ObservedObject<ThemeProvider>(wrappedValue: .shared)
    }
}
