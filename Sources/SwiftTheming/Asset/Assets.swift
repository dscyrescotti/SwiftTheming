import Foundation

public protocol Assets {
    associatedtype FontAsset: FontAssets
    associatedtype ColorAsset: ColorAssets
    associatedtype ImageAsset: ImageAssets
    associatedtype GradientAsset: GradientAssets
}

public protocol FontAssets {
    var identifier: String { get }
}
public protocol ColorAssets {
    var identifier: String { get }
}
public protocol ImageAssets {
    var identifier: String { get }
}
public protocol GradientAssets {
    var identifier: String { get }
}

public extension Assets {
    typealias FontAsset = EmptyAsset
    typealias ColorAsset = EmptyAsset
    typealias ImageAsset = EmptyAsset
    typealias GradientAsset = EmptyAsset
}
