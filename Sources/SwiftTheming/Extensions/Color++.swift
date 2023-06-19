import SwiftUI

public extension Color {
    /// A color of a given asset that allows to override the current appearance and theme optionally.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - appearance: preferred appearance to override current appearance
    ///   - theme: preferred theme to override current theme
    init<ThemeProfile: Theme>(_ asset: ThemeProfile.Asset.ColorAsset, appearance: PreferredAppearance?, theme: ThemeProfile?) {
        self = ThemeProvider.shared.color(for: asset, preferredAppearance: appearance, on: theme)
    }
}

extension Color {
    init(hex: String) {
        var colorHex = hex
        if colorHex.hasPrefix("#") {
            colorHex.removeFirst()
        }
        if colorHex.count == 3 {
            colorHex = String(repeating: colorHex[colorHex.startIndex], count: 2)
            + String(repeating: colorHex[colorHex.index(colorHex.startIndex, offsetBy: 1)], count: 2)
            + String(repeating: colorHex[colorHex.index(colorHex.startIndex, offsetBy: 2)], count: 2)
        } else if !colorHex.count.isMultiple(of: 2) || colorHex.count > 8 {
            self = Color.clear
            return
        }
        let scanner = Scanner(string: colorHex)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        if colorHex.count == 2 {
            let gray = Double(Int(color) & 0xFF) / 255
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
        } else if colorHex.count == 4 {
            let gray = Double(Int(color >> 8) & 0x00FF) / 255
            let alpha = Double(Int(color) & 0x00FF) / 255
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
        } else if colorHex.count == 6 {
            let red = Double(Int(color >> 16) & 0x0000FF) / 255
            let green = Double(Int(color >> 8) & 0x0000FF) / 255
            let blue = Double(Int(color) & 0x0000FF) / 255
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
        } else if colorHex.count == 8 {
            let red = Double(Int(color >> 24) & 0x000000FF) / 255
            let green = Double(Int(color >> 16) & 0x000000FF) / 255
            let blue = Double(Int(color >> 8) & 0x000000FF) / 255
            let alpha = Double(Int(color) & 0x000000FF) / 255
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
        } else {
            self = Color.clear
        }
    }
}
