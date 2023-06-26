import SwiftUI
import Foundation

struct DynamicColorAssets: Codable {
    var name: DynamicColorSet?
    var hex: DynamicColorSet?

    enum CodingKeys: CodingKey {
        case name
        case hex
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let name = try? container.decodeIfPresent(DynamicColorSet.self, forKey: .name) {
            self.name = name
        }
        if let name = try? container.decodeIfPresent(String.self, forKey: .name) {
            self.name = DynamicColorSet(any: name)
        }
        if let hex = try? container.decodeIfPresent(DynamicColorSet.self, forKey: .hex) {
            self.hex = hex
        }
        if let hex = try? container.decodeIfPresent(String.self, forKey: .hex) {
            self.hex = DynamicColorSet(any: hex)
        }
    }

    var colorSet: ColorSet {
        if let name = name?.any {
            return ColorSet(name: name)
        }
        if let hex = hex?.any {
            return ColorSet(hex: hex)
        }
        if let light = name?.light, let dark = name?.dark {
            return ColorSet(name: light, dark: dark)
        }
        if let light = hex?.light, let dark = hex?.dark {
            return ColorSet(hex: light, dark: dark)
        }
        return .empty
    }
}

struct DynamicColorSet: Codable {
    var any: String?
    var light: String?
    var dark: String?
}
