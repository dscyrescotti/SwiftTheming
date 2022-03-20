import SwiftUI

@propertyWrapper
public struct ThemeProviding<Theme: Themeable>: DynamicProperty {
    @EnvironmentObject private var themeProvider: ThemeProvider<Theme>
    
    public var wrappedValue: ThemeProvider<Theme> {
        themeProvider
    }
    
    public init() { }
}
