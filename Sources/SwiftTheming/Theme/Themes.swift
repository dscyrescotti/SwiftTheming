import SwiftUI
import Foundation

public protocol Themes: Codable {
    var id: String { get }

    associatedtype Asset: Assets
    func theme() -> AnyTheme
}

public extension Themes {
    static func color(_ asset: Asset.ColorAsset, appearance: PreferredAppearance? = nil, theme: Self? = nil) -> Color {
        Color(asset, appearance: appearance, theme: theme, on: Self.self)
    }
}
