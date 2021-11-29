import SwiftUI
import SwiftTheming

enum Theme: Themeable {
    case bluoTheme
    case jadoTheme
    
    func theme() -> Themed<Asset> {
        switch self {
        case .bluoTheme: return BluoTheme()
        case .jadoTheme: return JadoTheme()
        }
    }
    
    func named() -> String {
        switch self {
        case .bluoTheme: return "Bluo Theme"
        case .jadoTheme: return "Jado Theme"
        }
    }
}

struct Asset: Assetable {
    enum ColorAsset {
        case backgroundColor
        case accentColor
        case borderColor
        case contentColor
        case fontColor
    }
    
    enum ImageAsset {
        case planetImage
        case cloudImage
        case planetIcon
        case smokeImage
    }
    
    enum FontAsset {
        case titleFont
    }
}

class BluoTheme: Themed<Asset> {
    override func colorSet(for asset: Asset.ColorAsset) -> ColorSet {
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
    
    override func imageSet(for asset: Asset.ImageAsset) -> ImageSet {
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
    
    override func fontSet(for asset: Asset.FontAsset) -> FontSet {
        switch asset {
        case .titleFont:
            return FontSet(light: .headline, dark: .title3)
        }
    }
}

class JadoTheme: Themed<Asset> {
    override func colorSet(for asset: Asset.ColorAsset) -> ColorSet {
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
    
    override func imageSet(for asset: Asset.ImageAsset) -> ImageSet {
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
    
    
    override func fontSet(for asset: Asset.FontAsset) -> FontSet {
        switch asset {
        case .titleFont:
            return FontSet(light: .title, dark: .title2)
        }
    }
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
