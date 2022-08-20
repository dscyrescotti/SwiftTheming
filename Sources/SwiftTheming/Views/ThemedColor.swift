import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ThemedColor: View, ShapeStyle {
    private let asset: ColorAssetable
    
    @ThemeProviding private var themeProvider
    @Environment(\.preferredAppearance) var preferredAppearance
    @Environment(\.preferredTheme) var preferredTheme
    
    public init(_ asset: ColorAssetable) {
        self.asset = asset
    }
    
    public static func _makeView<S>(view: SwiftUI._GraphValue<SwiftUI._ShapeView<S, SwiftUI.Color>>, inputs: SwiftUI._ViewInputs) -> SwiftUI._ViewOutputs where S : SwiftUI.Shape {
        Color._makeView(view: view, inputs: inputs)
    }

    public func _apply(to shape: inout SwiftUI._ShapeStyle_Shape) {
        themeProvider.color(for: asset, preferredAppearance: preferredAppearance, on: preferredTheme)._apply(to: &shape)
    }

    public static func _apply(to type: inout SwiftUI._ShapeStyle_ShapeType) {
        Color._apply(to: &type)
    }
}
