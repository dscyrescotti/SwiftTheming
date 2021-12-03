import XCTest
@testable import SwiftTheming

final class SwiftThemingAssetableTests: XCTestCase {
    func testEmptyAsset() {
        XCTAssertTrue(EmptyAsset.ColorAsset.self == EmptyColorAsset.self)
        XCTAssertTrue(EmptyAsset.FontAsset.self == EmptyFontAsset.self)
        XCTAssertTrue(EmptyAsset.GradientAsset.self == EmptyGradientAsset.self)
        XCTAssertTrue(EmptyAsset.ImageAsset.self == EmptyImageAsset.self)
        XCTAssertNotNil(EmptyColorAsset.empty)
        XCTAssertNotNil(EmptyImageAsset.empty)
        XCTAssertNotNil(EmptyFontAsset.empty)
        XCTAssertNotNil(EmptyGradientAsset.empty)
    }
    
    func testAsset() {
        XCTAssertFalse(Asset.ColorAsset.self == EmptyColorAsset.self)
        XCTAssertFalse(Asset.FontAsset.self == EmptyFontAsset.self)
        XCTAssertFalse(Asset.GradientAsset.self == EmptyGradientAsset.self)
        XCTAssertFalse(Asset.ImageAsset.self == EmptyImageAsset.self)
    }
}

struct EmptyAsset: Assetable { }
