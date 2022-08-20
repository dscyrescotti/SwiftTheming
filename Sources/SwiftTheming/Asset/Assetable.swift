/// An abstraction layer to define any type of asset such as image asset, color asset, etc.
public protocol Assetable: AssetKeyWrappable {
    associatedtype _ColorAsset: ColorAssetable
    associatedtype _FontAsset: FontAssetable
    associatedtype _GradientAsset: GradientAssetable
    associatedtype _ImageAsset: ImageAssetable
    
    func colorSet(for asset: _ColorAsset) -> ColorSet
    func fontSet(for asset: _FontAsset) -> FontSet
    func gradientSet(for asset: _GradientAsset) -> GradientSet
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
