import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class FontTests: XCTestCase {
    
    func testFont() throws {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView() {
            Text("Hello World!").font(FontAsset.titleFont)
        }
        let view2 = SpyView() {
            Text("Hello World!").font(FontAsset.titleFont, theme: .bluoTheme)
        }
        let view3 = SpyView() {
            Text("Hello World!").font(FontAsset.titleFont, appearance: .dark)
        }
        let view4 = SpyView() { 
            Text("Hello World!").font(FontAsset.titleFont, appearance: .light, theme: .jadoTheme)
        }
        XCTAssertEqual(try view1.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .headline)
        XCTAssertEqual(try view2.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .headline)
        XCTAssertEqual(try view3.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .title3)
        XCTAssertEqual(try view4.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .title)

        themeProvider.setPreferredAppearance(with: .dark)
        XCTAssertEqual(try view1.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .title3)
        XCTAssertEqual(try view2.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .title3)
        XCTAssertEqual(try view3.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .title3)
        XCTAssertEqual(try view4.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .title)

        themeProvider.setTheme(with: .jadoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        XCTAssertEqual(try view1.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .title)
        XCTAssertEqual(try view2.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .headline)
        XCTAssertEqual(try view3.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .title2)
        XCTAssertEqual(try view4.inspect().find(SpyView<Text>.self).actualView().inspect().text().attributes().font(), .title)
    }
    
    func testFontViewModifier() throws {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView() {
            Text("Hello World!")
                .foregroundColor(ColorAsset.accentColor)
                .font(FontAsset.titleFont)
        }
        let view2 = SpyView() {
            Text("Hello World!")
                .foregroundColor(ColorAsset.accentColor)
                .font(FontAsset.titleFont, theme: .bluoTheme)
        }
        let view3 = SpyView() {
            Text("Hello World!")
                .foregroundColor(ColorAsset.accentColor)
                .font(FontAsset.titleFont, appearance: .dark)
        }
        let view4 = SpyView() {
            Text("Hello World!")
                .foregroundColor(ColorAsset.accentColor)
                .font(FontAsset.titleFont, appearance: .light, theme: .jadoTheme)
        }
        XCTAssertEqual(try view1.inspect().text().attributes().font(), .headline)
        XCTAssertEqual(try view2.inspect().text().attributes().font(), .headline)
        XCTAssertEqual(try view3.inspect().text().attributes().font(), .title3)
        XCTAssertEqual(try view4.inspect().text().attributes().font(), .title)

        themeProvider.setPreferredAppearance(with: .dark)
        XCTAssertEqual(try view1.inspect().text().attributes().font(), .title3)
        XCTAssertEqual(try view2.inspect().text().attributes().font(), .title3)
        XCTAssertEqual(try view3.inspect().text().attributes().font(), .title3)
        XCTAssertEqual(try view4.inspect().text().attributes().font(), .title)

        themeProvider.setTheme(with: .jadoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        XCTAssertEqual(try view1.inspect().text().attributes().font(), .title)
        XCTAssertEqual(try view2.inspect().text().attributes().font(), .headline)
        XCTAssertEqual(try view3.inspect().text().attributes().font(), .title2)
        XCTAssertEqual(try view4.inspect().text().attributes().font(), .title)
    }
    
    func testFontSet() {
        let fontSet1 = FontSet(default: .title2)
        XCTAssertEqual(fontSet1.appearance, .static(.title2))
        let fontSet2 = FontSet(light: .title, dark: .title3)
        XCTAssertEqual(fontSet2.appearance, .dynamic(light: .title, dark: .title3))
    }
}
