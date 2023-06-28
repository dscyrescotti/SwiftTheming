import SwiftUI
import Foundation

struct DynamicGradientAssets: Codable {
    var colors: DynamicGradientSet<String>?
    var stops: DynamicGradientSet<GradientStop>?

    enum CodingKeys: CodingKey {
        case colors
        case stops
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let colors = try? container.decodeIfPresent([String].self, forKey: .colors) {
            self.colors = DynamicGradientSet(any: colors)
        }
        if let colors = try? container.decodeIfPresent(DynamicGradientSet<String>.self, forKey: .colors) {
            self.colors = colors
        }
        if let stops = try? container.decodeIfPresent([GradientStop].self, forKey: .stops) {
            self.stops = DynamicGradientSet(any: stops)
        }
        if let stops = try? container.decodeIfPresent(DynamicGradientSet<GradientStop>.self, forKey: .stops) {
            self.stops = stops
        }
    }

    var gradientSet: GradientSet {
        if let colors = colors?.any {
            return GradientSet(default: Gradient(colors: colors.map { Color(hex: $0) }))
        }
        if let light = colors?.light, let dark = colors?.dark {
            return GradientSet(light: Gradient(colors: light.map { Color(hex: $0) }), dark: Gradient(colors: dark.map { Color(hex: $0) }))
        }
        if let stops = stops?.any {
            return GradientSet(default: Gradient(stops: stops.map { Gradient.Stop(color: Color(hex: $0.color), location: $0.location) }))
        }
        if let light = stops?.light, let dark = stops?.dark {
            return GradientSet(light: Gradient(stops: light.map { Gradient.Stop(color: Color(hex: $0.color), location: $0.location) }), dark: Gradient(stops: dark.map { Gradient.Stop(color: Color(hex: $0.color), location: $0.location) }))
        }
        return .empty
    }
}

struct DynamicGradientSet<Color: Codable>: Codable {
    var any: [Color]?
    var light: [Color]?
    var dark: [Color]?
}

struct GradientStop: Codable {
    var color: String
    var location: CGFloat
}
