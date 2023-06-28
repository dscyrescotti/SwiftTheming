import SwiftUI

/// A gradient set to define gradients based on light and dark appearances.
public struct GradientSet {
    let appearance: Appearance<Gradient>
    
    /// An initializer that defines a certain gradient for both light and dark appearances.
    /// - Parameter gradient: gradient for both light and dark appearances
    public init(`default` gradient: Gradient) {
        self.appearance = .static(gradient)
    }
    
    /// An initializer that defines gradients for light and dark appearances separately.
    /// - Parameters:
    ///   - light: gradient for light appearance
    ///   - dark: gradient for dark appearance
    public init(light: Gradient, dark: Gradient) {
        self.appearance = .dynamic(light: light, dark: dark)
    }

    static var empty: GradientSet = GradientSet(default: Gradient(colors: []))
}
