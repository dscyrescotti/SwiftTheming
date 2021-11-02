import SwiftUI

struct ImageSet {
    let appearance: Appearance<Image>
    
    init(`default` image: Image) {
        self.appearance = .static(image)
    }
    
    init(name: String) {
        self.appearance = .static(Image(name))
    }
    
    @available(macOS 11.0, *)
    init(systemName: String) {
        self.appearance = .static(Image(systemName: systemName))
    }
    
    init(light: Image, dark: Image) {
        self.appearance = .dynamic(light: light, dark: light)
    }
    
    @available(macOS 11.0, *)
    init(systemNameLight: String, systemNameDark: String) {
        self.appearance = .dynamic(light: Image(systemName: systemNameLight), dark: Image(systemName: systemNameDark))
    }
}
