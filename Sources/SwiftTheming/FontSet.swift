import SwiftUI

struct FontSet {
    let appearance: Appearance<Font>
    
    init(`default` font: Font) {
        self.appearance = .static(font)
    }
    
    init(light: Font, dark: Font) {
        self.appearance = .dynamic(light: light, dark: dark)
    }
}
