import XCTest
@testable import SwiftTheming

final class SwiftThemingAssetableTests: XCTestCase {
    func testEmptyAsset() {
        XCTAssertTrue(EmptyTheme._ColorAsset.self == EmptyColorAsset.self)
        XCTAssertTrue(EmptyTheme._FontAsset.self == EmptyFontAsset.self)
        XCTAssertTrue(EmptyTheme._GradientAsset.self == EmptyGradientAsset.self)
        XCTAssertTrue(EmptyTheme._ImageAsset.self == EmptyImageAsset.self)
    }

    func testAsset() {
        XCTAssertFalse(JadoTheme._ColorAsset.self == EmptyColorAsset.self)
        XCTAssertFalse(JadoTheme._FontAsset.self == EmptyFontAsset.self)
        XCTAssertFalse(JadoTheme._GradientAsset.self == EmptyGradientAsset.self)
        XCTAssertFalse(JadoTheme._ImageAsset.self == EmptyImageAsset.self)
    }
}

class EmptyTheme: Themed, Assetable {
    typealias _ColorAsset = EmptyColorAsset
    typealias _ImageAsset = EmptyImageAsset
    typealias _FontAsset = EmptyFontAsset
    typealias _GradientAsset = EmptyGradientAsset
}
