import SwiftUI

/// A preferred appearance to override system appearance.
public enum PreferredAppearance: Codable {
    /// An appearance that uses current system appearance.
    case system
    /// An appearance that uses light appearance.
    case light
    /// An appearance that uses dark appearance.
    case dark
    /// An appearance that switch automatically based on the scheduled timer.
    case automatic
}
