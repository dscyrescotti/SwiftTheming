import SwiftUI

/// An abstraction layer to define themes based on theme asset.
public protocol Themeable {
    /// A method that return `Themed` object based on theme.
    /// - Returns: theme object
    func themed() -> Themed
}
