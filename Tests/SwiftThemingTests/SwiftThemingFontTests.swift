import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class SwiftThemingFontTests: XCTestCase {
    
    func testFont() throws {
        let themeProvider = ThemeProvider<Theme>(defaultTheme: .bluoTheme, preferredAppearance: .light)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView(themeProvider: themeProvider) { themeProvider in
            Text("Hello World!").font(Font(on: themeProvider, for: .titleFont))
        }
        let view2 = SpyView(themeProvider: themeProvider) { themeProvider in
            Text("Hello World!").font(Font(on: themeProvider, for: .titleFont, theme: .bluoTheme))
        }
        let view3 = SpyView(themeProvider: themeProvider) { themeProvider in
            Text("Hello World!").font(Font(on: themeProvider, for: .titleFont, preferredAppearance: .dark))
        }
        let view4 = SpyView(themeProvider: themeProvider) { themeProvider in
            Text("Hello World!").font(Font(on: themeProvider, for: .titleFont, preferredAppearance: .light, theme: .jadoTheme))
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
    
    func testFontSet() {
        let fontSet1 = FontSet(default: .title2)
        XCTAssertEqual(fontSet1.appearance, .static(.title2))
        let fontSet2 = FontSet(light: .title, dark: .title3)
        XCTAssertEqual(fontSet2.appearance, .dynamic(light: .title, dark: .title3))
    }
}
