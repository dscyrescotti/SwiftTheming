import XCTest
import Combine
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class SwiftThemingTests: XCTestCase {
    func testThemeProvider() {
        let themeProvider = ThemeProvider<Theme>(defaultTheme: .bluoTheme, preferredAppearance: .light)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        XCTAssertEqual(themeProvider.theme, .bluoTheme)
        themeProvider.setTheme(with: .jadoTheme)
        XCTAssertEqual(themeProvider.theme, .jadoTheme)
        XCTAssertEqual(themeProvider.preferredAppearance, .light)
        themeProvider.setPreferredAppearance(with: .dark)
        XCTAssertEqual(themeProvider.preferredAppearance, .dark)
        themeProvider.setPreferredAppearance(with: .system)
        XCTAssertEqual(themeProvider.preferredAppearance, .system)
    }
}
