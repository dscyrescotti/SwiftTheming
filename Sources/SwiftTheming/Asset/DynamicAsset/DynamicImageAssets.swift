import SwiftUI
import Foundation

struct DynamicImageAssets: Codable {
    var name: DynamicImageSet?
    var systemName: DynamicImageSet?

    enum CodingKeys: CodingKey {
        case name
        case systemName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let name = try? container.decodeIfPresent(DynamicImageSet.self, forKey: .name) {
            self.name = name
        }
        if let name = try? container.decodeIfPresent(String.self, forKey: .name) {
            self.name = DynamicImageSet(any: name)
        }
        if let systemName = try? container.decodeIfPresent(DynamicImageSet.self, forKey: .systemName) {
            self.systemName = systemName
        }
        if let systemName = try? container.decodeIfPresent(String.self, forKey: .systemName) {
            self.systemName = DynamicImageSet(any: systemName)
        }
    }

    var imageSet: ImageSet {
        if let name = name?.any {
            return ImageSet(name: name)
        }
        if let systemName = systemName?.any {
            return ImageSet(systemName: systemName)
        }
        if let light = name?.light, let dark = name?.dark {
            return ImageSet(name: light, dark: dark)
        }
        if let light = systemName?.light, let dark = systemName?.dark {
            return ImageSet(systemName: light, dark: dark)
        }
        return .empty
    }
}

struct DynamicImageSet: Codable {
    var any: String?
    var light: String?
    var dark: String?
}

