import Foundation

public protocol Assets {
    associatedtype FontAsset: FontAssets
    associatedtype ColorAsset: ColorAssets
    associatedtype ImageAsset: ImageAssets
    associatedtype GradientAsset: GradientAssets
}

public protocol FontAssets { }
public protocol ColorAssets { }
public protocol ImageAssets { }
public protocol GradientAssets { }

public extension Assets {
    typealias FontAsset = EmptyAsset
    typealias ColorAsset = EmptyAsset
    typealias ImageAsset = EmptyAsset
    typealias GradientAsset = EmptyAsset
}
