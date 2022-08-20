public struct EmptyAsset: ColorAssetable, FontAssetable, GradientAssetable, ImageAssetable { }

public extension Assetable where _ColorAsset == EmptyAsset {
    func colorSet(for: EmptyAsset) -> ColorSet {
        fatalError("You are accessing an empty color asset.")
    }
}

public extension Assetable where _FontAsset == EmptyAsset {
    func fontSet(for asset: EmptyAsset) -> FontSet {
        fatalError("You are accessing an empty font asset.")
    }
}

public extension Assetable where _GradientAsset == EmptyAsset {
    func gradientSet(for asset: EmptyAsset) -> GradientSet {
        fatalError("You are accessing an empty gradient asset.")
    }
}

public extension Assetable where _ImageAsset == EmptyAsset {
    func imageSet(for asset: EmptyAsset) -> ImageSet {
        fatalError("You are accessing an empty image asset.")
    }
}
