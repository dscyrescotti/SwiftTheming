import XCTest
@testable import SwiftTheming

final class DefaultThemingTests: XCTestCase {
    func testDefaultTheming() {
        let defaultTheming = DefaultTheming()
        XCTAssertEqual(defaultTheming.defaultTheme(), .bluoTheme)
        XCTAssertEqual(defaultTheming.defaultAppearance(), .system)
        
        let defautable = defaultTheming.defaultable
        XCTAssertEqual(defautable.defaultTheme(), .bluoTheme)
        XCTAssertEqual(defautable.defaultAppearance(), .system)
    }
}
