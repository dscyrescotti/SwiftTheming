import XCTest
@testable import SwiftTheming

final class AssetableTests: XCTestCase {
    func testEmptyAsset() {
        XCTAssertTrue(EmptyTheme._ColorAsset.self == EmptyAsset.self)
        XCTAssertTrue(EmptyTheme._FontAsset.self == EmptyAsset.self)
        XCTAssertTrue(EmptyTheme._GradientAsset.self == EmptyAsset.self)
        XCTAssertTrue(EmptyTheme._ImageAsset.self == EmptyAsset.self)
    }

    func testAsset() {
        XCTAssertFalse(JadoTheme._ColorAsset.self == EmptyAsset.self)
        XCTAssertFalse(JadoTheme._FontAsset.self == EmptyAsset.self)
        XCTAssertFalse(JadoTheme._GradientAsset.self == EmptyAsset.self)
        XCTAssertFalse(JadoTheme._ImageAsset.self == EmptyAsset.self)
    }
}

class EmptyTheme: Themed, Assetable {
    typealias _ColorAsset = EmptyAsset
    typealias _ImageAsset = EmptyAsset
    typealias _FontAsset = EmptyAsset
    typealias _GradientAsset = EmptyAsset
}
