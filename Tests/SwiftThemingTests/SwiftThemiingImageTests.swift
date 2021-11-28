import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class SwiftThemingImageTests: XCTestCase {
    
    func testImageBasedOnAppearance() throws {
        let themeProvider = ThemeProvider<Theme>(defaultTheme: .bluoTheme, preferredAppearance: .light)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: .planetImage)
        }
        let view2 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: .planetImage, theme: .bluoTheme)
        }
        let view3 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: .planetImage, preferredAppearance: .dark)
        }
        let view4 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: .planetImage, preferredAppearance: .dark, theme: .jadoTheme)
        }
        XCTAssertEqual(try view1.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("sun"))
        XCTAssertEqual(try view2.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("sun"))
        XCTAssertEqual(try view3.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("moon"))
        XCTAssertEqual(try view4.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("moon"))
        
        themeProvider.setPreferredAppearance(with: .dark)
        XCTAssertEqual(try view1.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("moon"))
        XCTAssertEqual(try view2.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("moon"))
        XCTAssertEqual(try view3.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("moon"))
        XCTAssertEqual(try view4.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("moon"))
    }
    
    func testImageBasedOnTheme() throws {
        let themeProvider = ThemeProvider<Theme>(defaultTheme: .bluoTheme, preferredAppearance: .light)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: .smokeImage)
        }
        let view2 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: .smokeImage, theme: .jadoTheme)
        }
        let view3 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: .smokeImage, preferredAppearance: .dark)
        }
        let view4 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: .smokeImage, preferredAppearance: .dark, theme: .bluoTheme)
        }
        XCTAssertEqual(try view1.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("blue"))
        XCTAssertEqual(try view2.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("green"))
        XCTAssertEqual(try view3.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("blue"))
        XCTAssertEqual(try view4.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("blue"))
        
        themeProvider.setTheme(with: .jadoTheme)
        XCTAssertEqual(try view1.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("green"))
        XCTAssertEqual(try view2.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("green"))
        XCTAssertEqual(try view3.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("green"))
        XCTAssertEqual(try view4.inspect().find(SpyView<Image>.self).actualView().inspect().image().actualImage(), Image("blue"))
    }
}
