import XCTest
import Combine
import SwiftUI
@testable import SwiftTheming

final class SwiftThemingTests: XCTestCase {
    
    override class func setUp() {
        UserDefaults.standard.removeObject(forKey: "theming.theme.key")
        UserDefaults.standard.removeObject(forKey: "theming.preferredAppearance.key")
    }
    
    func testThemeChange() {
        let themeProvider: ThemeProvider<Theme> = .init(defaultTheme: .bluoTheme, preferredAppearance: .system)
        let themeSpy = ValueSpy<Theme>(themeProvider.$theme.eraseToAnyPublisher())
        XCTAssertEqual(themeSpy.values, [.bluoTheme])
        themeProvider.setTheme(with: .jadoTheme)
        XCTAssertEqual(themeSpy.values, [.bluoTheme, .jadoTheme])
        themeProvider.setTheme(with: .jadoTheme)
        XCTAssertEqual(themeSpy.values, [.bluoTheme, .jadoTheme, .jadoTheme])
    }
    
    func testPreferredAppearanceChange() {
        let themeProvider: ThemeProvider<Theme> = .init(defaultTheme: .bluoTheme, preferredAppearance: .light)
        let appearancePublisher = themeProvider.$preferredAppearance.eraseToAnyPublisher()
        let appearanceSpy = ValueSpy<PreferredAppearance>(appearancePublisher)
        XCTAssertEqual(appearanceSpy.values, [.light])
        XCTAssertEqual(themeProvider.color(for: .accentColor), Color(hex: 0x667DFF))
        XCTAssertEqual(themeProvider.color(for: .accentColor, preferredAppearance: .dark), Color(hex: 0x5C74FF))
        themeProvider.setPreferredAppearance(with: .dark)
        XCTAssertEqual(appearanceSpy.values, [.light, .dark])
        XCTAssertEqual(themeProvider.color(for: .accentColor), Color(hex: 0x5C74FF))
    }
}
