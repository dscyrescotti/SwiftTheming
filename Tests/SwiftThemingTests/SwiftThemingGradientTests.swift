import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftTheming

final class SwiftThemingGradientTests: XCTestCase {
    func testGradient() throws {
        let themeProvider = ThemeProvider.shared
        themeProvider.changeColorScheme(with: nil)
        themeProvider.setTheme(with: .bluoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        let view1 = SpyView(themeProvider: themeProvider) { themeProvider in
            LinearGradient(
                gradient: Gradient(GradientAsset.backgroundGradient),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
        let view2 = SpyView(themeProvider: themeProvider) { themeProvider in
            LinearGradient(
                gradient: Gradient(GradientAsset.backgroundGradient, theme: .bluoTheme),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
        let view3 = SpyView(themeProvider: themeProvider) { themeProvider in
            LinearGradient(
                gradient: Gradient(GradientAsset.backgroundGradient, appearance: .dark),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
        let view4 = SpyView(themeProvider: themeProvider) { themeProvider in
            LinearGradient(
                gradient: Gradient(GradientAsset.backgroundGradient, appearance: .light, theme: .jadoTheme),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
        XCTAssertEqual(try view1.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.blue, .white]))
        XCTAssertEqual(try view2.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.blue, .white]))
        XCTAssertEqual(try view3.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.blue, .black]))
        XCTAssertEqual(try view4.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.green, .white]))

        themeProvider.setPreferredAppearance(with: .dark)
        XCTAssertEqual(try view1.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.blue, .black]))
        XCTAssertEqual(try view2.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.blue, .black]))
        XCTAssertEqual(try view3.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.blue, .black]))
        XCTAssertEqual(try view4.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.green, .white]))

        themeProvider.setTheme(with: .jadoTheme)
        themeProvider.setPreferredAppearance(with: .light)
        XCTAssertEqual(try view1.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.green, .white]))
        XCTAssertEqual(try view2.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.blue, .white]))
        XCTAssertEqual(try view3.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.green, .black]))
        XCTAssertEqual(try view4.inspect().find(SpyView<LinearGradient>.self).actualView().inspect().linearGradient().gradient(), Gradient(colors: [.green, .white]))
    }
    
    func testGradientSet() {
        let gradientSet1 = GradientSet(default: Gradient(colors: [.green, .blue]))
        XCTAssertEqual(gradientSet1.appearance, .static(Gradient(colors: [.green, .blue])))
        let gradientSet2 = GradientSet(light: Gradient(colors: [.red, .white]), dark: Gradient(colors: [.red, .black]))
        XCTAssertEqual(gradientSet2.appearance, .dynamic(light: Gradient(colors: [.red, .white]), dark: Gradient(colors: [.red, .black])))
    }
}
