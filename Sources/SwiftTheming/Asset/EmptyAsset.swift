import Foundation

public struct EmptyAsset {
    static public let empty: EmptyAsset = .init()

    public var identifier: String { "empty_asset" }
}

extension EmptyAsset: FontAssets { }
extension EmptyAsset: ColorAssets { }
extension EmptyAsset: ImageAssets { }
extension EmptyAsset: GradientAssets { }
