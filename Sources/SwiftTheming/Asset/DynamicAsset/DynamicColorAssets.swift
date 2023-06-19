import SwiftUI
import Foundation

struct DynamicColorAssets: Codable {
    var `static`: String?
    var name: String?
    var dynamic: DynamicColorSet?

    var colorSet: ColorSet {
        if let name {
            return ColorSet(name: name)
        }
        if let dynamic {
            return ColorSet(light: Color(hex: dynamic.light), dark: Color(hex: dynamic.dark))
        }
        if let `static` {
            return ColorSet(default: Color(hex: `static`))
        }
        return .empty
    }
}

struct DynamicColorSet: Codable {
    var light: String
    var dark: String
}
