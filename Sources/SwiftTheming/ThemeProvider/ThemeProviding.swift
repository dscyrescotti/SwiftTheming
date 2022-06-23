import SwiftUI

@propertyWrapper
/// A property wrapper type that accesses theme provider shared from the ancestors' view.
public struct ThemeProviding<Theme: Themeable>: DynamicProperty {
    @EnvironmentObject private var themeProvider: ThemeProvider<Theme>
    
    public var wrappedValue: ThemeProvider<Theme> {
        themeProvider
    }
    
    public init() { }
}
