import Foundation

public struct EmptyAsset {
    static public let empty: EmptyAsset = .init()
}

extension EmptyAsset: FontAssets { }
extension EmptyAsset: ColorAssets { }
extension EmptyAsset: ImageAssets { }
extension EmptyAsset: GradientAssets { }
