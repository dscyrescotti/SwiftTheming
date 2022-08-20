import SwiftUI
import SwiftTheming
import ViewInspector

struct TestView: View, Inspectable {
    @ThemeProviding var themeProvider
    var didAppear: ((Self) -> Void)? = { _ in }
    
    var body: some View {
        Color(on: themeProvider, for: ColorAsset.accentColor)
            .onAppear {
                themeProvider.setTheme(with: .jadoTheme)
                themeProvider.setPreferredAppearance(with: .dark)
                didAppear?(self)
            }
    }
}
