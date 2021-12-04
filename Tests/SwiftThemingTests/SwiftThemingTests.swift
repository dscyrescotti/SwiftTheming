import XCTest
import Combine
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class SwiftThemingTests: XCTestCase {
    
    func testThemeProviderWithSpy() {
        let themeProvider = ThemeProvider<Theme>(defaultTheme: .bluoTheme, preferredAppearance: .light)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        
        let themeSpy = ValueSpy<Theme>.init(themeProvider.$theme.eraseToAnyPublisher())
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setTheme(with: .jadoTheme)
        themeProvider.setTheme(with: .jadoTheme)
        XCTAssertEqual(themeSpy.values, [.bluoTheme, .jadoTheme])
        
        let appearanceSpy = ValueSpy<PreferredAppearance>.init(themeProvider.$preferredAppearance.eraseToAnyPublisher())
        themeProvider.setPreferredAppearance(with: .dark)
        themeProvider.setPreferredAppearance(with: .dark)
        themeProvider.setPreferredAppearance(with: .light)
        themeProvider.setPreferredAppearance(with: .system)
        XCTAssertEqual(appearanceSpy.values, [.light, .dark, .light, .system])
        
        let voidSpy = ValueSpy<Void>.init(themeProvider.objectWillChange.eraseToAnyPublisher())
        themeProvider.setPreferredAppearance(with: .light)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.changeColorScheme(with: .light)
        themeProvider.setPreferredAppearance(with: .system)
        themeProvider.setPreferredAppearance(with: .system)
        XCTAssertEqual(voidSpy.values.count, 4)
        
        let colorSchemeSpy = ValueSpy<ColorScheme?>.init(themeProvider.$colorScheme.eraseToAnyPublisher())
        themeProvider.changeColorScheme(with: .light)
        themeProvider.changeColorScheme(with: .dark)
        themeProvider.changeColorScheme(with: .dark)
        themeProvider.changeColorScheme(with: .light)
        XCTAssertEqual(colorSchemeSpy.values, [.light, .dark, .light])
    }
    
    func testModifier() {
        let sub = EmptyView().themeProviding(defaultTheme: Theme.bluoTheme)
        XCTAssertNoThrow(try sub.inspect().modifier(ThemeProvidingViewModifier<Theme>.self, 0))
        XCTAssertNoThrow(try sub.inspect().modifier(ThemeProvidingViewModifier<Theme>.self, 0).viewModifierContent())
    }
    
}

extension ThemeProvidingViewModifier: Inspectable { }
