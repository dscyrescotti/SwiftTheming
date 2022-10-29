import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class ColorTests: XCTestCase {
    
    func testColor() throws {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView() {
            Color(ColorAsset.backgroundColor)
        }
        let view2 = SpyView() {
            Color(ColorAsset.backgroundColor, theme: .bluoTheme)
        }
        let view3 = SpyView() {
            Color(ColorAsset.backgroundColor, appearance: .dark)
        }
        let view4 = SpyView() { 
            Color(ColorAsset.backgroundColor, appearance: .light, theme: .jadoTheme)
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
    
    func testForegroundColor() throws {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView() {
            Text("Spy View").foregroundColor(ColorAsset.backgroundColor)
        }
        let view2 = SpyView() {
            Text("Spy View").foregroundColor(ColorAsset.backgroundColor, theme: .bluoTheme)
        }
        let view3 = SpyView() {
            Text("Spy View").foregroundColor(ColorAsset.backgroundColor, appearance: .dark)
        }
        let view4 = SpyView() {
            Text("Spy View").foregroundColor(ColorAsset.backgroundColor, appearance: .dark, theme: .jadoTheme)
        }
        
        XCTAssertEqual(try view1.inspect().text().attributes().foregroundColor(), Color(hex: 0xD6E0FF))
        XCTAssertEqual(try view2.inspect().text().attributes().foregroundColor(), Color(hex: 0xD6E0FF))
        XCTAssertEqual(try view3.inspect().text().attributes().foregroundColor(), Color(hex: 0x162350))
        XCTAssertEqual(try view4.inspect().text().attributes().foregroundColor(), Color(hex: 0x22442E))

        themeProvider.setPreferredAppearance(with: .dark)
        XCTAssertEqual(try view1.inspect().text().attributes().foregroundColor(), Color(hex: 0x162350))
        XCTAssertEqual(try view2.inspect().text().attributes().foregroundColor(), Color(hex: 0x162350))
        XCTAssertEqual(try view3.inspect().text().attributes().foregroundColor(), Color(hex: 0x162350))
        XCTAssertEqual(try view4.inspect().text().attributes().foregroundColor(), Color(hex: 0x22442E))

        themeProvider.setTheme(with: .jadoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        XCTAssertEqual(try view1.inspect().text().attributes().foregroundColor(), Color(hex: 0xDEF8EA))
        XCTAssertEqual(try view2.inspect().text().attributes().foregroundColor(), Color(hex: 0xD6E0FF))
        XCTAssertEqual(try view3.inspect().text().attributes().foregroundColor(), Color(hex: 0x22442E))
        XCTAssertEqual(try view4.inspect().text().attributes().foregroundColor(), Color(hex: 0x22442E))
    }
    
    func testBackgroundColor() throws {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView() {
            Text("Spy View").background(ColorAsset.backgroundColor)
        }
        let view2 = SpyView() {
            Text("Spy View").background(ColorAsset.backgroundColor, theme: .bluoTheme)
        }
        let view3 = SpyView() {
            Text("Spy View").background(ColorAsset.backgroundColor, appearance: .dark)
        }
        let view4 = SpyView() { 
            Text("Spy View").background(ColorAsset.backgroundColor, appearance: .dark, theme: .jadoTheme)
        }
        
        XCTAssertEqual(try view1.inspect().text().background().color().value(), Color(hex: 0xD6E0FF))
        XCTAssertEqual(try view2.inspect().text().background().color().value(), Color(hex: 0xD6E0FF))
        XCTAssertEqual(try view3.inspect().text().background().color().value(), Color(hex: 0x162350))
        XCTAssertEqual(try view4.inspect().text().background().color().value(), Color(hex: 0x22442E))

        themeProvider.setPreferredAppearance(with: .dark)
        XCTAssertEqual(try view1.inspect().text().background().color().value(), Color(hex: 0x162350))
        XCTAssertEqual(try view2.inspect().text().background().color().value(), Color(hex: 0x162350))
        XCTAssertEqual(try view3.inspect().text().background().color().value(), Color(hex: 0x162350))
        XCTAssertEqual(try view4.inspect().text().background().color().value(), Color(hex: 0x22442E))

        themeProvider.setTheme(with: .jadoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        XCTAssertEqual(try view1.inspect().text().background().color().value(), Color(hex: 0xDEF8EA))
        XCTAssertEqual(try view2.inspect().text().background().color().value(), Color(hex: 0xD6E0FF))
        XCTAssertEqual(try view3.inspect().text().background().color().value(), Color(hex: 0x22442E))
        XCTAssertEqual(try view4.inspect().text().background().color().value(), Color(hex: 0x22442E))
    }
}
