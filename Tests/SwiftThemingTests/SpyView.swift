import SwiftUI
import SwiftTheming
import ViewInspector

struct SpyView<Content: View>: View, Inspectable {
    @ObservedObject var themeProvider: ThemeProvider<Theme>
    let content: (ThemeProvider<Theme>) -> Content
    var body: some View {
        content(themeProvider)
    }
}
