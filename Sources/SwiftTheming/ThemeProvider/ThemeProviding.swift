import SwiftUI

@propertyWrapper
/// A property wrapper type that accesses theme provider shared from the ancestors' view.
public struct ThemeProviding: DynamicProperty {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    public var wrappedValue: ThemeProvider {
        themeProvider
    }
    
    public init() { }
}
