import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class SwiftThemingColorTests: XCTestCase {
    
    func testColor() throws {
        let themeProvider = ThemeProvider<Theme>(defaultTheme: .bluoTheme, preferredAppearance: .light)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView(themeProvider: themeProvider) { themeProvider in
            Color(on: themeProvider, for: .backgroundColor)
        }
        let view2 = SpyView(themeProvider: themeProvider) { themeProvider in
            Color(on: themeProvider, for: .backgroundColor, theme: .bluoTheme)
        }
        let view3 = SpyView(themeProvider: themeProvider) { themeProvider in
            Color(on: themeProvider, for: .backgroundColor, preferredAppearance: .dark)
        }
        let view4 = SpyView(themeProvider: themeProvider) { themeProvider in
            Color(on: themeProvider, for: .backgroundColor, preferredAppearance: .light, theme: .jadoTheme)
        }
        XCTAssertEqual(try view1.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0xD6E0FF))
        XCTAssertEqual(try view2.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0xD6E0FF))
        XCTAssertEqual(try view3.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0x162350))
        XCTAssertEqual(try view4.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0xDEF8EA))
        
        themeProvider.setPreferredAppearance(with: .dark)
        XCTAssertEqual(try view1.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0x162350))
        XCTAssertEqual(try view2.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0x162350))
        XCTAssertEqual(try view3.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0x162350))
        XCTAssertEqual(try view4.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0xDEF8EA))
        
        themeProvider.setTheme(with: .jadoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        XCTAssertEqual(try view1.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0xDEF8EA))
        XCTAssertEqual(try view2.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0xD6E0FF))
        XCTAssertEqual(try view3.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0x22442E))
        XCTAssertEqual(try view4.inspect().find(SpyView<Color>.self).actualView().inspect().color().value(), Color(hex: 0xDEF8EA))
    }
    
    func testColorSet() {
        let colorSet1 = ColorSet(light: .white, dark: .black)
        XCTAssertEqual(colorSet1.appearance, .dynamic(light: .white, dark: .black))
        let colorSet2 = ColorSet(default: .red)
        XCTAssertEqual(colorSet2.appearance, .static(.red))
        let colorSet3 = ColorSet(name: "color")
        XCTAssertEqual(colorSet3.appearance, .static(Color("color")))
    }
}
