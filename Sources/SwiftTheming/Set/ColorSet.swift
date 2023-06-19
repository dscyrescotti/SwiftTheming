import SwiftUI

/// A color set to define colors based on light and dark appearances.
public struct ColorSet {
    let appearance: Appearance<Color>
    
    /// An initializer that defines a certain color for both light and dark appearances.
    /// - Parameter color: color for both light and dark appearances
    public init(`default` color: Color) {
        self.appearance = .static(color)
    }
    
    /// An initializer to load a color from Asset Catalog.
    /// - Parameter color: color from Asset Catalog
    public init(name: String) {
        self.appearance = .static(Color(name))
    }
    
    
    /// An initializer that defines colors for light and dark appearances separately.
    /// - Parameters:
    ///   - light: color for light appearance
    ///   - dark: color for dark appearance
    public init(light: Color, dark: Color) {
        self.appearance = .dynamic(light: light, dark: dark)
    }

    static var empty: ColorSet = ColorSet(default: .white)
}
