import SwiftUI
import Foundation

struct DynamicImageAssets: Codable {
    var name: String?
    var systemName: String?
    var dynamic: DynamicImageSet?
    var systemNameDynamic: DynamicImageSet?

    var imageSet: ImageSet {
        if let name {
            return ImageSet(name: name)
        }
        if let systemName {
            return ImageSet(systemName: systemName)
        }
        if let dynamic {
            return ImageSet(light: Image(dynamic.light), dark: Image(dynamic.dark))
        }
        if let systemNameDynamic {
            return ImageSet(systemNameLight: systemNameDynamic.light, systemNameDark: systemNameDynamic.dark)
        }
        return .empty
    }
}

struct DynamicImageSet: Codable {
    var light: String
    var dark: String
}

