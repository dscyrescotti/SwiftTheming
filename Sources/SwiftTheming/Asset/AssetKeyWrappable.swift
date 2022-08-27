public protocol AssetKeyWrappable {
    func _colorSet(for asset: ColorAssetable) -> ColorSet
    func _fontSet(for asset: FontAssetable) -> FontSet
    func _gradientSet(for asset: GradientAssetable) -> GradientSet
    func _imageSet(for asset: ImageAssetable) -> ImageSet
}
