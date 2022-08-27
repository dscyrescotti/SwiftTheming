public protocol Defaultable {
    func defaultTheme() -> Theme
    func defaultAppearance() -> PreferredAppearance
}

public struct DefaultTheming {
    var defaultable: Defaultable {
        self as! Defaultable
    }
}
