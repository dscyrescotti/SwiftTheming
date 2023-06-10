import SwiftUI

/// A property wrapper type that accesses theme provider shared from the ancestors' view.
@propertyWrapper
public struct ThemeEnvironment: DynamicProperty {
    @EnvironmentObject private var themeProvider: ThemeProvider

    public var wrappedValue: any Themes {
        themeProvider.theme
    }

    public init() { }
}
