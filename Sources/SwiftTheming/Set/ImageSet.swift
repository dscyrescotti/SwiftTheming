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

    public init(name light: String, dark: String) {
        self.appearance = .dynamic(light: Image(light), dark: Image(dark))
    }

    /// An initializer that defines a certain system icon for both light and dark appearances.
    /// - Parameter systemName: system icon name for both light and dark appearances
    public init(systemName: String) {
        self.appearance = .static(Image(systemName: systemName))
    }

    /// An initializer that defines system icons for light and dark appearances separately.
    /// - Parameters:
    ///   - light: system icon name for light appearance
    ///   - dark: system icon name for dark appearance
    public init(systemName light: String, dark: String) {
        self.appearance = .dynamic(light: Image(systemName: light), dark: Image(systemName: dark))
    }

    /// An initializer that defines images for light and dark appearances separately.
    /// - Parameters:
    ///   - light: image for light appearance
    ///   - dark: image for dark appearance
    public init(light: Image, dark: Image) {
        self.appearance = .dynamic(light: light, dark: dark)
    }

    static var empty: ImageSet = ImageSet(default: .empty)
}
