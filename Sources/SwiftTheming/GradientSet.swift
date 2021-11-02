import SwiftUI

struct GradientSet {
    let appearance: Appearance<Gradient>
    
    init(`default` gradient: Gradient) {
        self.appearance = .static(gradient)
    }
    
    init(light: Gradient, dark: Gradient) {
        self.appearance = .dynamic(light: light, dark: dark)
    }
}
