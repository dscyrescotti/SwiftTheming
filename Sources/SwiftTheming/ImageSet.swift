import SwiftUI

public struct ImageSet {
    let appearance: Appearance<Image>
    
    public init(`default` image: Image) {
        self.appearance = .static(image)
    }
    
    public init(name: String) {
        self.appearance = .static(Image(name))
    }
    
    @available(macOS 11.0, *)
    public init(systemName: String) {
        self.appearance = .static(Image(systemName: systemName))
    }
    
    public init(light: Image, dark: Image) {
        self.appearance = .dynamic(light: light, dark: dark)
    }
    
    @available(macOS 11.0, *)
    public init(systemNameLight: String, systemNameDark: String) {
        self.appearance = .dynamic(light: Image(systemName: systemNameLight), dark: Image(systemName: systemNameDark))
    }
}
