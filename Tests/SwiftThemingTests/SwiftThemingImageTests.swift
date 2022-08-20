import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class SwiftThemingImageTests: XCTestCase {
    
    func testImageBasedOnAppearance() throws {
        let themeProvider = ThemeProvider(defaultTheme: .bluoTheme, preferredAppearance: .light)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: ImageAsset.planetImage)
        }
        let view2 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: ImageAsset.planetImage, theme: .bluoTheme)
        }
        let view3 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: ImageAsset.planetImage, preferredAppearance: .dark)
        }
        let view4 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: ImageAsset.planetImage, preferredAppearance: .dark, theme: .jadoTheme)
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
        let themeProvider = ThemeProvider(defaultTheme: .bluoTheme, preferredAppearance: .light)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: ImageAsset.smokeImage)
        }
        let view2 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: ImageAsset.smokeImage, theme: .jadoTheme)
        }
        let view3 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: ImageAsset.smokeImage, preferredAppearance: .dark)
        }
        let view4 = SpyView(themeProvider: themeProvider) { themeProvider in
            Image(on: themeProvider, for: ImageAsset.smokeImage, preferredAppearance: .dark, theme: .bluoTheme)
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
    
    func testImageSet() {
        let imageSet1 = ImageSet(light: Image(systemName: "heart.fill"), dark: Image(systemName: "heart"))
        XCTAssertEqual(imageSet1.appearance, .dynamic(light: Image(systemName: "heart.fill"), dark: Image(systemName: "heart")))
        let imageSet2 = ImageSet(systemNameLight: "heart.fill", systemNameDark: "heart")
        XCTAssertEqual(imageSet2.appearance, .dynamic(light: Image(systemName: "heart.fill"), dark: Image(systemName: "heart")))
        let imageSet3 = ImageSet(systemName: "heart.fill")
        XCTAssertEqual(imageSet3.appearance, .static(Image(systemName: "heart.fill")))
        let imageSet4 = ImageSet(default: Image(systemName: "heart.fill"))
        XCTAssertEqual(imageSet4.appearance, .static(Image(systemName: "heart.fill")))
        let imageSet5 = ImageSet(name: "green")
        XCTAssertEqual(imageSet5.appearance, .static(Image("green")))
    }
    
    
}
