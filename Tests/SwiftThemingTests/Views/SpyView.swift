import SwiftUI
import SwiftTheming
import ViewInspector

struct SpyView<Content: View>: View, Inspectable {
    @ObservedObject var themeProvider: ThemeProvider
    let content: (ThemeProvider) -> Content
    var body: some View {
        content(themeProvider)
    }
}
