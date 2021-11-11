#if os(macOS)
import AppKit
typealias _Color = NSColor
#else
import UIKit
typealias _Color = UIColor
#endif
import SwiftUI

public extension Color {
    var contrastColor: Color {
        let color = _Color(self)
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        brightness = ((r * 299) + (g * 587) + (b * 114)) / 1000
        return brightness < 0.5 ? Color.white : Color.black
    }
}
