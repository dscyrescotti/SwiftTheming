import SwiftUI
import SwiftTheming
import ViewInspector

struct SpyView<Content: View>: View, Inspectable {
    let content: () -> Content
    
    var body: some View {
        content()
    }
}
