//
//  Theme.swift
//  Example
//
//  Created by Dscyre Scotti on 07/11/2021.
//

import SwiftUI
import SwiftTheming

enum Theme: Themeable {
    case caelumTheme
    
    func theme() -> Themed<Asset> {
        switch self {
        case .caelumTheme: return CaelumTheme()
        }
    }
}

struct Asset: Assetable {
    enum ColorAsset {
        case backgroundColor
        case accentColor
    }
}

class CaelumTheme: Themed<Asset> {
    override func colorSet(for asset: Asset.ColorAsset) -> ColorSet {
        switch asset {
        case .backgroundColor:
            return ColorSet(light: Color(hex: 0xB2C4FF), dark: Color(hex: 0x172453))
        case .accentColor:
            return ColorSet(light: Color(hex: 0x788CFF), dark: Color(hex: 0x323D77))
        }
    }
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

extension Color {
    public init(hex: Int) {
        self.init(UIColor(hex: hex))
   }
}
