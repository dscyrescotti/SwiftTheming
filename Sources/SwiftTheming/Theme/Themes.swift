import SwiftUI
import Foundation

public protocol Themes: Codable {
    var id: String { get }

    associatedtype Asset: Assets
    func theme() -> AnyTheme
}
