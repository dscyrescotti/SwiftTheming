import Foundation

struct DynamicAssets: Codable {
    var colorAssets: [String: DynamicColorAssets]
    var imageAssets: [String: DynamicImageAssets]
    var fontAssets: [String: DynamicFontAssets]
    var gradientAssets: [String: DynamicGradientAssets]

    enum CodingKeys: String, CodingKey {
        case colorAssets = "color_assets"
        case imageAssets = "image_assets"
        case fontAssets = "font_assets"
        case gradientAssets = "gradient_assets"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let colorAssets = try container.decodeIfPresent([[String: DynamicColorAssets]].self, forKey: .colorAssets) ?? []
        self.colorAssets = colorAssets.reduce(into: [:]) { result, dict in
            for (key, value) in dict {
                result[key.camelCased()] = value
            }
        }
        let imageAssets = try container.decodeIfPresent([[String: DynamicImageAssets]].self, forKey: .imageAssets) ?? []
        self.imageAssets = imageAssets.reduce(into: [:]) { result, dict in
            for (key, value) in dict {
                result[key.camelCased()] = value
            }
        }
        let fontAssets = try container.decodeIfPresent([[String: DynamicFontAssets]].self, forKey: .fontAssets) ?? []
        self.fontAssets = fontAssets.reduce(into: [:]) { result, dict in
            for (key, value) in dict {
                result[key.camelCased()] = value
            }
        }
        let gradientAssets = try container.decodeIfPresent([[String: DynamicGradientAssets]].self, forKey: .gradientAssets) ?? []
        self.gradientAssets = gradientAssets.reduce(into: [:]) { result, dict in
            for (key, value) in dict {
                result[key.camelCased()] = value
            }
        }
    }
}
