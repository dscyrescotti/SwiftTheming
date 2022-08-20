import SwiftUI

/// An abstraction layer to define themes based on theme asset.
public protocol Themeable {
    func themed() -> Themed
}
