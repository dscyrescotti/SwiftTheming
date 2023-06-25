import Foundation

struct DynamicAssets: Codable {
    var colorAssets: [String: DynamicColorAssets]
    var imageAssets: [String: DynamicImageAssets]

    enum CodingKeys: String, CodingKey {
        case colorAssets = "color_assets"
        case imageAssets = "image_assets"
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
    }
}
