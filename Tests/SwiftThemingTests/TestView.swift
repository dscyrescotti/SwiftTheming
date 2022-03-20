import SwiftUI
import SwiftTheming
import ViewInspector

struct TestView: View, Inspectable {
    @ThemeProviding<Theme> var themeProvider
    var didAppear: ((Self) -> Void)? = { _ in }
    
    var body: some View {
        Color(on: themeProvider, for: .accentColor)
            .onAppear {
                themeProvider.setTheme(with: .jadoTheme)
                themeProvider.setPreferredAppearance(with: .dark)
                didAppear?(self)
            }
    }
}
