public struct EmptyColorAsset: ColorAssetable { }

public struct EmptyFontAsset: FontAssetable { }

public struct EmptyGradientAsset: GradientAssetable { }

public struct EmptyImageAsset: ImageAssetable { }

public extension Assetable where _ColorAsset == EmptyColorAsset {
    func colorSet(for: EmptyColorAsset) -> ColorSet {
        fatalError("You are accessing an empty color asset.")
    }
}

public extension Assetable where _FontAsset == EmptyFontAsset {
    func fontSet(for asset: EmptyFontAsset) -> FontSet {
        fatalError("You are accessing an empty font asset.")
    }
}

public extension Assetable where _GradientAsset == EmptyGradientAsset {
    func gradientSet(for asset: EmptyGradientAsset) -> GradientSet {
        fatalError("You are accessing an empty gradient asset.")
    }
}

public extension Assetable where _ImageAsset == EmptyImageAsset {
    func imageSet(for asset: EmptyImageAsset) -> ImageSet {
        fatalError("You are accessing an empty image asset.")
    }
}
