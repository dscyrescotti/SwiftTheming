import SwiftUI

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

public struct EmptyColorAsset {
    private init() { }
    static let empty: Self = .init()
}

public struct EmptyImageAsset {
    private init() { }
    static let empty: Self = .init()
}

public struct EmptyGradientAsset {
    private init() { }
    static let empty: Self = .init()
}

public struct EmptyFontAsset {
    private init() { }
    static let empty: Self = .init()
}
