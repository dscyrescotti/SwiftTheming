/// An abstraction layer to define any type of asset such as image asset, color asset, etc.
public protocol Assetable: AssetKeyWrappable {
    associatedtype _ColorAsset: ColorAssetable
    associatedtype _FontAsset: FontAssetable
    associatedtype _GradientAsset: GradientAssetable
    associatedtype _ImageAsset: ImageAssetable
    
    /// A method that defines color set based on the given color asset.
    /// - Parameter asset: desired color asset
    /// - Returns: color set
    func colorSet(for asset: _ColorAsset) -> ColorSet
    /// A method that defines font set based on the given font asset.
    /// - Parameter asset: desired font asset
    /// - Returns: font set
    func fontSet(for asset: _FontAsset) -> FontSet
    /// A method that defines gradient set based on the given gradient asset.
    /// - Parameter asset: desired gradient asset
    /// - Returns: gradient set
    func gradientSet(for asset: _GradientAsset) -> GradientSet
    /// A method that defines image set based on the given image asset.
    /// - Parameter asset: desired image asset
    /// - Returns: image set
    func imageSet(for asset: _ImageAsset) -> ImageSet
}

extension Assetable {
    public func _colorSet(for asset: ColorAssetable) -> ColorSet {
        colorSet(for: asset as! _ColorAsset)
    }
    
    public func _fontSet(for asset: FontAssetable) -> FontSet {
        fontSet(for: asset as! _FontAsset)
    }
    
    public func _gradientSet(for asset: GradientAssetable) -> GradientSet {
        gradientSet(for: asset as! _GradientAsset)
    }
    
    public func _imageSet(for asset: ImageAssetable) -> ImageSet {
        imageSet(for: asset as! _ImageAsset)
    }
}

/// An abstraction layer to define list of color asset keys.
public protocol ColorAssetable { }

/// An abstraction layer to define list of font asset keys.
public protocol FontAssetable { }

/// An abstraction layer to define list of gradient asset keys.
public protocol GradientAssetable { }

/// An abstraction layer to define list of image asset keys.
public protocol ImageAssetable { }
