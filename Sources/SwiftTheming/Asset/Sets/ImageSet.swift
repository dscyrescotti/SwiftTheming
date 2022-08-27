import SwiftUI

/// A image set to define images based on light and dark appearances.
public struct ImageSet {
    let appearance: Appearance<Image>
    
    /// An initializer that defines a certain image for both light and dark appearances.
    /// - Parameter image: image for both light and dark appearances
    public init(`default` image: Image) {
        self.appearance = .static(image)
    }
    
    /// An initializer to load a image from Asset Catalog.
    /// - Parameter name: image from Asset Catalog
    public init(name: String) {
        self.appearance = .static(Image(name))
    }
    
    /// An initializer that defines a certain system icon for both light and dark appearances.
    /// - Parameter systemName: system icon name for both light and dark appearances
    public init(systemName: String) {
        self.appearance = .static(Image(systemName: systemName))
    }
    
    /// An initializer that defines images for light and dark appearances separately.
    /// - Parameters:
    ///   - light: image for light appearance
    ///   - dark: image for dark appearance
    public init(light: Image, dark: Image) {
        self.appearance = .dynamic(light: light, dark: dark)
    }
    
    /// An initializer that defines system icons for light and dark appearances separately.
    /// - Parameters:
    ///   - systemNameLight: system icon name for light appearance
    ///   - systemNameDark: system icon name for dark appearance
    public init(systemNameLight: String, systemNameDark: String) {
        self.appearance = .dynamic(light: Image(systemName: systemNameLight), dark: Image(systemName: systemNameDark))
    }
}
