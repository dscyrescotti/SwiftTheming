import SwiftUI

 public protocol Assetable {
    associatedtype ColorAsset
    associatedtype ImageAsset
    associatedtype GradientAsset
    associatedtype FontAsset
}

extension Assetable {
    typealias ColorAsset = EmptyColorAsset
    typealias ImageAsset = EmptyImageAsset
    typealias GradientAsset = EmptyGradientAsset
    typealias FontAsset = EmptyFontAsset
}

struct EmptyColorAsset {
    private init() { }
    static let empty: Self = .init()
}

struct EmptyImageAsset {
    private init() { }
    static let empty: Self = .init()
}

struct EmptyGradientAsset {
    private init() { }
    static let empty: Self = .init()
}

struct EmptyFontAsset {
    private init() { }
    static let empty: Self = .init()
}
