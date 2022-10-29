import SwiftUI
import SwiftTheming
import ViewInspector

struct SolarTestView: View, Inspectable {
    let inspection = Inspection<Self>()
    
    var body: some View {
        VStack {
            Color(ColorAsset.backgroundColor)
                .frame(width: 200, height: 200)
            Text("Hello World!")
                .font(FontAsset.titleFont)
            Image(ImageAsset.planetImage, theme: .bluoTheme)
            LinearGradient(
                gradient: Gradient(GradientAsset.backgroundGradient),
                startPoint: .bottom,
                endPoint: .top
            )
            Color(ColorAsset.fontColor, appearance: .light)
        }
        .onReceive(inspection.notice) {
            self.inspection.visit(self, $0)
        }
    }
}
