//
//  Theme.swift
//  Example
//
//  Created by Dscyre Scotti on 07/11/2021.
//

import SwiftUI
import SwiftTheming

extension Theme: Themeable, Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
    
    static let bluoTheme = Theme(key: "bluoTheme")
    static let jadoTheme = Theme(key: "jadoTheme")
    
    public func themed() -> Themed {
        switch self {
        case .bluoTheme: return BluoTheme()
        case .jadoTheme: return JadoTheme()
        default: fatalError("You are accessing an undefined theme.")
        }
    }
    
    func named() -> String {
        switch self {
        case .bluoTheme: return "Bluo Theme"
        case .jadoTheme: return "Jado Theme"
        default: fatalError("You are accessing an undefined theme.")
        }
    }
}

enum ColorAsset: ColorAssetable {
    case backgroundColor
    case accentColor
    case borderColor
    case contentColor
    case fontColor
}

enum ImageAsset: ImageAssetable {
    case planetImage
    case cloudImage
    case planetIcon
}

extension Assetable {
    typealias _ColorAsset = ColorAsset
    typealias _ImageAsset = ImageAsset
    typealias _GradientAsset = EmptyAsset
    typealias _FontAsset = EmptyAsset
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
        }
    }
}
