import XCTest
import SwiftUI
import ViewInspector
@testable import SwiftTheming

class SwiftThemingThemeProvidingTests: XCTestCase {
    
    func testThemeProviding() {
        var sut = TestView()
        let exp = sut.on(\.didAppear) { view in
            XCTAssertEqual(try view.actualView().inspect().color().value(), Color(hex: 0x37BE6F))
        }
        ViewHosting.host(view: sut.themeProviding())
        wait(for: [exp], timeout: 0.5)
    }
}
