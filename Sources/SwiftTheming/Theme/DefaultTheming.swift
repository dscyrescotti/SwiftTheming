/// An abstraction layer that defines default theme and appearance of the app.
public protocol Defaultable {
    /// A method that returns default theme.
    /// - Returns: theme
    func defaultTheme() -> Theme
    /// A method that returns default preferred appearance.
    /// - Returns: appearance
    func defaultAppearance() -> PreferredAppearance
}

/// A struct that will store default theme and appearance for the app. This is mandatory to conform `Defaultable` on call side.
public struct DefaultTheming {
    var defaultable: Defaultable {
        self as! Defaultable
    }
}
