import SwiftUI
import SwiftTheming

extension Theme: Themeable {
    static let bluoTheme = Theme(key: "bluoTheme")
    static let jadoTheme = Theme(key: "jadoTheme")
    
    public func themed() -> Themed {
        switch self {
        case .bluoTheme: return BluoTheme()
        case .jadoTheme: return JadoTheme()
        default: fatalError("You are accessing undefined theme.")
        }
    }
    
    public func named() -> String {
        switch self {
        case .bluoTheme: return "Bluo Theme"
        case .jadoTheme: return "Jado Theme"
        default: fatalError("You are accessing undefined theme.")
        }
    }
}

extension DefaultTheming: Defaultable {
    public func defaultTheme() -> Theme {
        .bluoTheme
    }
    
    public func defaultAppearance() -> PreferredAppearance {
        .system
    }
}

enum ColorAsset: ColorAssetable {
    case backgroundColor
    case accentColor
    case borderColor
    case contentColor
    case fontColor
}

enum FontAsset: FontAssetable {
    case titleFont
    case staticFont
}

enum GradientAsset: GradientAssetable {
    case backgroundGradient
    case staticGradient
}

enum ImageAsset: ImageAssetable {
    case planetImage
    case cloudImage
    case planetIcon
    case smokeImage
}

class BluoTheme: Themed, Assetable {
    func colorSet(for asset: ColorAsset) -> ColorSet {
        switch asset {
        case .backgroundColor:
            return ColorSet(light: Color(hex: 0xD6E0FF), dark: Color(hex: 0x162350))
        case .accentColor:
            return ColorSet(light: Color(hex: 0x667DFF), dark: Color(hex: 0x5C74FF))
        case .borderColor:
            return ColorSet(default: Color(hex: 0x6F7FC3))
        case .contentColor:
            return ColorSet(default: Color(hex: 0xF3F5F7))
        case .fontColor:
            return ColorSet(light: Color(hex: 0x1e1e1f), dark: Color(hex: 0xF3F5F7))
        }
    }
    
    func imageSet(for asset: ImageAsset) -> ImageSet {
        switch asset {
        case .planetImage:
            return ImageSet(light: Image("sun"), dark: Image("moon"))
        case .cloudImage:
            return ImageSet(name: "cloud")
        case .planetIcon:
            return ImageSet(light: Image(systemName: "sun.max.fill"), dark: Image(systemName: "moon.fill"))
        case .smokeImage:
            return ImageSet(name: "blue")
        }
    }

    func fontSet(for asset: FontAsset) -> FontSet {
        switch asset {
        case .titleFont:
            return FontSet(light: .headline, dark: .title3)
        case .staticFont:
            return FontSet(default: .title2)
        }
    }

    func gradientSet(for asset: GradientAsset) -> GradientSet {
        switch asset {
        case .backgroundGradient:
            return GradientSet(light: Gradient(colors: [.blue, .white]), dark: Gradient(colors: [.blue, .black]))
        case .staticGradient:
            return GradientSet(default: Gradient(colors: [.red, .yellow]))
        }
    }
}

class JadoTheme: Themed, Assetable {
    func colorSet(for asset: ColorAsset) -> ColorSet {
        switch asset {
        case .backgroundColor:
            return ColorSet(light: Color(hex: 0xDEF8EA), dark: Color(hex: 0x22442E))
        case .accentColor:
            return ColorSet(light: Color(hex: 0x4DCC82), dark: Color(hex: 0x37BE6F))
        case .borderColor:
            return ColorSet(default: Color(hex: 0x83AF94))
        case .contentColor:
            return ColorSet(default: Color(hex: 0xF3F5F7))
        case .fontColor:
            return ColorSet(light: Color(hex: 0x1e1e1f), dark: Color(hex: 0xF3F5F7))
        }
    }
    
    func imageSet(for asset: ImageAsset) -> ImageSet {
        switch asset {
        case .planetImage:
            return ImageSet(light: Image("sun"), dark: Image("moon"))
        case .cloudImage:
            return ImageSet(name: "cloud")
        case .planetIcon:
            return ImageSet(light: Image(systemName: "sun.max.fill"), dark: Image(systemName: "moon.fill"))
        case .smokeImage:
            return ImageSet(name: "green")
        }
    }
    
    func fontSet(for asset: FontAsset) -> FontSet {
        switch asset {
        case .titleFont:
            return FontSet(light: .title, dark: .title2)
        case .staticFont:
            return FontSet(default: .title2)
        }
    }
    
    func gradientSet(for asset: GradientAsset) -> GradientSet {
        switch asset {
        case .backgroundGradient:
            return GradientSet(light: Gradient(colors: [.green, .white]), dark: Gradient(colors: [.green, .black]))
        case .staticGradient:
            return GradientSet(default: Gradient(colors: [.red, .yellow]))
        }
    }
}

extension Assetable {
    typealias _ColorAsset = ColorAsset
    typealias _FontAsset = FontAsset
    typealias _GradientAsset = GradientAsset
    typealias _ImageAsset = ImageAsset
}

#if os(macOS)
typealias _Color = NSColor
#else
typealias _Color = UIColor
#endif

extension Color {
    public init(hex: Int) {
        self.init(_Color(hex: hex))
   }
}

extension _Color {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
