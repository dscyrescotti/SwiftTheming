import Foundation

/// A struct that can be used as a theme.
public struct Theme: Codable, Equatable {
    /// A key that stores the unique identifier.
    public let key: String
    
    /// An initializer that create a theme containing a unique identifier.
    /// - Parameter key: unique identifier
    public init(key: String) {
        self.key = key
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.key = try container.decode(String.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.key)
    }
}

extension Theme {
    internal func _themed() -> Themed {
        (self as! Themeable).themed()
    }
    
    internal func colorSet(for asset: ColorAssetable) -> ColorSet {
        (_themed() as! AssetKeyWrappable)._colorSet(for: asset)
    }
    
    internal func fontSet(for asset: FontAssetable) -> FontSet {
        (_themed() as! AssetKeyWrappable)._fontSet(for: asset)
    }
    
    internal func gradientSet(for asset: GradientAssetable) -> GradientSet {
        (_themed() as! AssetKeyWrappable)._gradientSet(for: asset)
    }
    
    internal func imageSet(for asset: ImageAssetable) -> ImageSet {
        (_themed() as! AssetKeyWrappable)._imageSet(for: asset)
    }
}
