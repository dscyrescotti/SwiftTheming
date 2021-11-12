//
//  Theme.swift
//  Example
//
//  Created by Dscyre Scotti on 07/11/2021.
//

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
    }
    
    enum ImageAsset {
        case planetImage
        case cloudImage
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
        }
    }
    
    override func imageSet(for asset: Asset.ImageAsset) -> ImageSet {
        switch asset {
        case .planetImage:
            return ImageSet(light: Image("sun"), dark: Image("moon"))
        case .cloudImage:
            return ImageSet(name: "cloud")
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
        }
    }
    
    override func imageSet(for asset: Asset.ImageAsset) -> ImageSet {
        switch asset {
        case .planetImage:
            return ImageSet(light: Image("sun"), dark: Image("moon"))
        case .cloudImage:
            return ImageSet(name: "cloud")
        }
    }
}
