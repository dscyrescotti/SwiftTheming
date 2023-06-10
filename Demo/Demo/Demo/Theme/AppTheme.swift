//
//  AppTheme.swift
//  Demo
//
//  Created by Dscyre Scotti on 6/10/23.
//

import SwiftUI
import SwiftTheming

enum AppTheme: String, Themes {
    case minimalistic

    var id: String {
        self.rawValue
    }

    func theme() -> AnyTheme {
        switch self {
        case .minimalistic:
            return MinimalisticTheme().eraseToAnyTheme()
        }
    }
}

extension AppTheme {
    struct Asset: Assets {
        enum ColorAsset: ColorAssets {
            case primaryBody
            case secondaryBody
            case primaryBackground
        }
        enum ImageAsset: ImageAssets { }
    }
}
