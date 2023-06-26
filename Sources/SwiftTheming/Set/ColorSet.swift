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
    
    /// An initializer to load colors from Asset Catalog for light and dark appearances.
    /// - Parameters:
    ///   - light: color from Asset Catalog for light appearance
    ///   - dark: color from Asset Catalog for dark appearance
    public init(name light: String, dark: String) {
        self.appearance = .dynamic(light: Color(light), dark: Color(dark))
    }

    /// An initializer that defines a certain color with a hex color code for both light and dark appearances.
    /// - Parameter hex: hex color code for both light and dark appearances
    public init(hex: String) {
        self.appearance = .static(Color(hex: hex))
    }
    
    /// An initializer that defines colors with hex color codes for both light and dark appearances respectively.
    /// - Parameters:
    ///   - light: hex color code for light appearance
    ///   - dark: hex color code for dark appearance
    public init(hex light: String, dark: String) {
        self.appearance = .dynamic(light: Color(hex: light), dark: Color(hex: dark))
    }

    /// An initializer that defines colors for light and dark appearances separately.
    /// - Parameters:
    ///   - light: color for light appearance
    ///   - dark: color for dark appearance
    public init(light: Color, dark: Color) {
        self.appearance = .dynamic(light: light, dark: dark)
    }

    static var empty: ColorSet = ColorSet(default: .clear)
}
