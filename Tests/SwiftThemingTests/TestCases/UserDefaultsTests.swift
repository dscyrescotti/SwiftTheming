import XCTest
import SwiftUI
@testable import SwiftTheming

final class UserDefaultsTests: XCTestCase {
    func testUserDefaults() {
        let themeKey = UserDefaults.Key.theme
        let appearanceKey = UserDefaults.Key.preferredAppearance
        XCTAssertEqual(themeKey.rawValue, "theming.theme.key")
        XCTAssertEqual(appearanceKey.rawValue, "theming.preferredAppearance.key")
        
        UserDefaults.standard.removeObject(forKey: themeKey.rawValue)
        UserDefaults.standard.removeObject(forKey: appearanceKey.rawValue)
        
        XCTAssertNil(UserDefaults.get(Theme.self, key: .theme))
        XCTAssertNil(UserDefaults.get(PreferredAppearance.self, key: .preferredAppearance))
        
        UserDefaults.set(Theme.jadoTheme, key: .theme)
        XCTAssertEqual(UserDefaults.get(Theme.self, key: .theme), .jadoTheme)
        
        UserDefaults.set(PreferredAppearance.system, key: .preferredAppearance)
        XCTAssertEqual(UserDefaults.get(PreferredAppearance.self, key: .preferredAppearance), .system)
        
        UserDefaults.set(Theme.bluoTheme, key: .theme)
        XCTAssertEqual(UserDefaults.get(Theme.self, key: .theme), .bluoTheme)
        
        UserDefaults.set(PreferredAppearance.light, key: .preferredAppearance)
        XCTAssertEqual(UserDefaults.get(PreferredAppearance.self, key: .preferredAppearance), .light)
        
        UserDefaults.set(PreferredAppearance.dark, key: .preferredAppearance)
        XCTAssertEqual(UserDefaults.get(PreferredAppearance.self, key: .preferredAppearance), .dark)
        
        UserDefaults.set(FailedEcodeObject(), key: .theme)
        XCTAssertEqual(UserDefaults.get(Theme.self, key: .theme), .bluoTheme)
    }
}

struct FailedEcodeObject: Codable {
    func encode(to encoder: Encoder) throws {
        throw EncodingError.invalidValue("", .init(codingPath: [], debugDescription: "", underlyingError: nil))
    }
}
