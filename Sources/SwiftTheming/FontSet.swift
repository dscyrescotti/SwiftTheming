import SwiftUI

public struct FontSet {
    let appearance: Appearance<Font>
    
    public init(`default` font: Font) {
        self.appearance = .static(font)
    }
    
    public init(light: Font, dark: Font) {
        self.appearance = .dynamic(light: light, dark: dark)
    }
}
