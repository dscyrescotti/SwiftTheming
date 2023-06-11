import SwiftUI
import Foundation

public protocol Theme: Codable {
    var id: String { get }

    associatedtype Asset: Assets
    func themeStyle() -> AnyThemeStyle
}
