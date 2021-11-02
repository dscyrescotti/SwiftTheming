import SwiftUI

public struct ColorSet {
    let appearance: Appearance<Color>
    
    public init(`default` color: Color) {
        self.appearance = .static(color)
    }
    
    public init(name: String) {
        self.appearance = .static(Color(name))
    }
    
    public init(light: Color, dark: Color) {
        self.appearance = .dynamic(light: light, dark: dark)
    }
}
