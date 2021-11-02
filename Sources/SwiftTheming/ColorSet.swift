import SwiftUI

struct ColorSet {
    let appearance: Appearance<Color>
    
    init(`default` color: Color) {
        self.appearance = .static(color)
    }
    
    init(name: String) {
        self.appearance = .static(Color(name))
    }
    
    init(light: Color, dark: Color) {
        self.appearance = .dynamic(light: light, dark: dark)
    }
}
