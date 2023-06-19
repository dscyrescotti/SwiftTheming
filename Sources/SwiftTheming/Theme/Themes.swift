import SwiftUI
import Foundation

public protocol Theme: Codable {
    var identifier: String { get }

    associatedtype Asset: Assets
    func themeStyle() -> AnyThemeStyle
}
