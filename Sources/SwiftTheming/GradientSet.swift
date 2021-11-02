import SwiftUI

public struct GradientSet {
    let appearance: Appearance<Gradient>
    
    public init(`default` gradient: Gradient) {
        self.appearance = .static(gradient)
    }
    
    public init(light: Gradient, dark: Gradient) {
        self.appearance = .dynamic(light: light, dark: dark)
    }
}
