import SwiftUI
import Foundation

struct DynamicFontAssets: Codable {
    var system: DynamicFontSet?

    enum CodingKeys: CodingKey {
        case system
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let system = try? container.decodeIfPresent(String.self, forKey: .system) {
            self.system = DynamicFontSet(any: SystemFont(style: Font.TextStyle(rawValue: system)))
        }
        if let system = try? container.decodeIfPresent(SystemFont.self, forKey: .system) {
            self.system = DynamicFontSet(any: system)
        }
        if let system = try? container.decodeIfPresent(DynamicFontSet.self, forKey: .system) {
            self.system = system
        }
    }

    var fontSet: FontSet {
        if let systemFont = system?.any?.font {
            return FontSet(default: systemFont)
        }
        if let light = system?.light?.font, let dark = system?.dark?.font {
            return FontSet(light: light, dark: dark)
        }
        return .empty
    }
}

struct DynamicFontSet: Codable {
    var any: SystemFont?
    var light: SystemFont?
    var dark: SystemFont?

    enum CodingKeys: CodingKey {
        case any
        case light
        case dark
    }

    init(any: SystemFont) {
        self.any = any
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.light = try container.decode(SystemFont.self, forKey: .light)
        self.dark = try container.decode(SystemFont.self, forKey: .dark)
    }
}

struct SystemFont: Codable {
    var size: CGFloat?
    var style: Font.TextStyle?
    var design: Font.Design?
    var weight: Font.Weight?

    var font: Font? {
        if #available(iOS 16, macOS 13, watchOS 9, tvOS 16, *) {
            if let size {
                return Font.system(size: size, weight: weight, design: design)
            }
            if let style {
                return Font.system(style, design: design, weight: weight)
            }
        } else {
            if let style {
                return Font.system(style, design: design ?? .default)
            }
        }
        return nil
    }
}

extension Font.TextStyle: RawRepresentable, Codable {
    public init?(rawValue: String) {
        switch rawValue {
        case "largeTitle": self = .largeTitle
        case "title": self = .title
        case "title2": self = .title2
        case "title3": self = .title3
        case "headline": self = .headline
        case "subheadline": self = .subheadline
        case "body": self = .body
        case "callout": self = .callout
        case "footnote": self = .footnote
        case "caption": self = .caption
        case "caption2": self = .caption2
        default: return nil
        }
    }
    
    public typealias RawValue = String

    public var rawValue: String {
        switch self {
        case .largeTitle:
            "largeTitle"
        case .title:
            "title"
        case .title2:
            "title2"
        case .title3:
            "title3"
        case .headline:
            "headline"
        case .subheadline:
            "subheadline"
        case .body:
            "body"
        case .callout:
            "callout"
        case .footnote:
            "footnote"
        case .caption:
            "caption"
        case .caption2:
            "caption2"
        @unknown default:
            ""
        }
    }
}

extension Font.Design: RawRepresentable, Codable {
    public init?(rawValue: String) {
        switch rawValue {
        case "default": self = .default
        case "serif": self = .serif
        case "rounded": self = .rounded
        case "monospaced": self = .monospaced
        default: return nil
        }
    }

    public typealias RawValue = String

    public var rawValue: String {
        switch self {
        case .default:
            "default"
        case .serif:
            "serif"
        case .rounded:
            "rounded"
        case .monospaced:
            "monospaced"
        @unknown default:
            ""
        }
    }
}

extension Font.Weight: RawRepresentable, Codable {
    public init?(rawValue: String) {
        switch rawValue {
        case "ultraLight": self = .ultraLight
        case "thin": self = .thin
        case "light": self = .light
        case "regular": self = .regular
        case "medium": self = .medium
        case "semibold": self = .semibold
        case "bold": self = .bold
        case "heavy": self = .heavy
        case "black": self = .black
        default: return nil
        }
    }

    public typealias RawValue = String

    public var rawValue: String {
        switch self {
        case .ultraLight: "ultraLight"
        case .thin: "thin"
        case .light: "light"
        case .regular: "regular"
        case .medium: "medium"
        case .semibold: "semibold"
        case .bold: "bold"
        case .heavy: "heavy"
        case .black: "black"
        default: ""
        }
    }
}
