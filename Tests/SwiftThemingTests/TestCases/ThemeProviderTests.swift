import XCTest
import Combine
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class ThemeProviderTests: XCTestCase {
    
    func testThemeProviderWithSpy() {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
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
        let sub = EmptyView().themeProviding()
        XCTAssertNoThrow(try sub.inspect().modifier(ThemeProvidingViewModifier.self, 0))
        XCTAssertNoThrow(try sub.inspect().modifier(ThemeProvidingViewModifier.self, 0).viewModifierContent())
    }
    
    func testColor() {
        let themeProvider = ThemeProvider.shared
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .system)
        XCTAssertEqual(themeProvider.color(for: ColorAsset.backgroundColor, preferredAppearance: nil, on: nil), Color(hex: 0xD6E0FF))
        themeProvider.changeColorScheme(with: .light)
        XCTAssertEqual(themeProvider.color(for: ColorAsset.backgroundColor, preferredAppearance: nil, on: nil), Color(hex: 0xD6E0FF))
        themeProvider.changeColorScheme(with: .dark)
        XCTAssertEqual(themeProvider.color(for: ColorAsset.backgroundColor, preferredAppearance: nil, on: nil), Color(hex: 0x162350))
        XCTAssertEqual(themeProvider.color(for: ColorAsset.borderColor, preferredAppearance: nil, on: nil), Color(hex: 0x6F7FC3))
    }
    
    func testImage() {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .system)
        XCTAssertEqual(themeProvider.image(for: ImageAsset.planetImage, preferredAppearance: nil, on: nil), Image("sun"))
        themeProvider.changeColorScheme(with: .light)
        XCTAssertEqual(themeProvider.image(for: ImageAsset.planetImage, preferredAppearance: nil, on: nil), Image("sun"))
        themeProvider.changeColorScheme(with: .dark)
        XCTAssertEqual(themeProvider.image(for: ImageAsset.planetImage, preferredAppearance: nil, on: nil), Image("moon"))
    }
    
    func testFont() {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .system)
        XCTAssertEqual(themeProvider.font(for: FontAsset.titleFont, preferredAppearance: nil, on: nil), .headline)
        themeProvider.changeColorScheme(with: .light)
        XCTAssertEqual(themeProvider.font(for: FontAsset.titleFont, preferredAppearance: nil, on: nil), .headline)
        themeProvider.changeColorScheme(with: .dark)
        XCTAssertEqual(themeProvider.font(for: FontAsset.titleFont, preferredAppearance: nil, on: nil), .title3)
        XCTAssertEqual(themeProvider.font(for: FontAsset.staticFont, preferredAppearance: nil, on: nil), .title2)
    }
    
    func testGradient() {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .system)
        XCTAssertEqual(themeProvider.gradient(for: GradientAsset.backgroundGradient, preferredAppearance: nil, on: nil), Gradient(colors: [.blue, .white]))
        themeProvider.changeColorScheme(with: .light)
        XCTAssertEqual(themeProvider.gradient(for: GradientAsset.backgroundGradient, preferredAppearance: nil, on: nil), Gradient(colors: [.blue, .white]))
        themeProvider.changeColorScheme(with: .dark)
        XCTAssertEqual(themeProvider.gradient(for: GradientAsset.backgroundGradient, preferredAppearance: nil, on: nil), Gradient(colors: [.blue, .black]))
        XCTAssertEqual(themeProvider.gradient(for: GradientAsset.staticGradient, preferredAppearance: nil, on: nil), Gradient(colors: [.red, .yellow]))
    }
    
}

extension ThemeProvidingViewModifier: Inspectable { }
