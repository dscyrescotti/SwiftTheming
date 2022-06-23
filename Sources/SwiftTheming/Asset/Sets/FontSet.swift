import SwiftUI

/// A font set to define fonts based on light and dark appearances.
public struct FontSet {
    let appearance: Appearance<Font>
    
    /// An initializer that defines a certain font for both light and dark appearances.
    /// - Parameter font: font for both light and dark appearances
    public init(`default` font: Font) {
        self.appearance = .static(font)
    }
    
    /// An initializer that defines fonts for light and dark appearances separately.
    /// - Parameters:
    ///   - light: font for light appearance
    ///   - dark: font for dark appearance
    public init(light: Font, dark: Font) {
        self.appearance = .dynamic(light: light, dark: dark)
    }
}
