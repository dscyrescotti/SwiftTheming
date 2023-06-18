//
//  MinimalisticThemeStyle.swift
//  Demo
//
//  Created by Dscyre Scotti on 6/9/23.
//

import SwiftUI
import SwiftTheming

struct MinimalisticThemeStyle: ThemeStyle {
    typealias ThemeProfile = AppTheme

    func colorSet(_ asset: AppTheme.Asset.ColorAsset) -> ColorSet {
        switch asset {
        case .primaryBody:
            return ColorSet(default: .primary)
        case .secondaryBody:
            return ColorSet(default: .secondary)
        case .primaryBackground:
            return ColorSet(light: .yellow.opacity(0.4), dark: .black.opacity(0.4))
        }
    }
}
