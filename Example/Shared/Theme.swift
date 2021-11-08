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
}

struct Asset: Assetable {
    enum ColorAsset {
        case backgroundColor
        case accentColor
    }
}

class BluoTheme: Themed<Asset> {
    override func colorSet(for asset: Asset.ColorAsset) -> ColorSet {
        switch asset {
        case .backgroundColor:
            return ColorSet(light: Color(hex: 0xD6E0FF), dark: Color(hex: 0x162350))
        case .accentColor:
            return ColorSet(light: Color(hex: 0x788CFF), dark: Color(hex: 0x42529E))
        }
    }
}

class JadoTheme: Themed<Asset> {
    override func colorSet(for asset: Asset.ColorAsset) -> ColorSet {
        switch asset {
        case .backgroundColor:
            return ColorSet(light: Color(hex: 0xDEF8EA), dark: Color(hex: 0x22442E))
        case .accentColor:
            return ColorSet(light: Color(hex: 0x97DDB4), dark: Color(hex: 0x499767))
        }
    }
}
