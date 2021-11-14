import SwiftUI

/// An abstraction layer to define any type of asset such as image asset, color asset, etc.
public protocol Assetable {
    associatedtype ColorAsset
    associatedtype ImageAsset
    associatedtype GradientAsset
    associatedtype FontAsset
}

public extension Assetable {
    typealias ColorAsset = EmptyColorAsset
    typealias ImageAsset = EmptyImageAsset
    typealias GradientAsset = EmptyGradientAsset
    typealias FontAsset = EmptyFontAsset
}

/// An empty asset of colors.
public struct EmptyColorAsset {
    private init() { }
    static let empty: Self = .init()
}

/// An empty asset of images.
public struct EmptyImageAsset {
    private init() { }
    static let empty: Self = .init()
}

/// An empty asset of gradients.
public struct EmptyGradientAsset {
    private init() { }
    static let empty: Self = .init()
}

/// An empty asset of fonts.
public struct EmptyFontAsset {
    private init() { }
    static let empty: Self = .init()
}
