import SwiftUI

/// A property wrapper type that accesses theme provider shared from the ancestors' view.
@propertyWrapper
public struct ThemeProviding: DynamicProperty {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    public var wrappedValue: ThemeProvider {
        themeProvider
    }
    
    public init() { }
}
