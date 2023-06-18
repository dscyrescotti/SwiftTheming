//
//  AppTheme.swift
//  Demo
//
//  Created by Dscyre Scotti on 6/10/23.
//

import SwiftUI
import SwiftTheming

public enum AppTheme: String, Theme {
    case minimalistic

    public var id: String {
        self.rawValue
    }

    public func themeStyle() -> AnyThemeStyle {
        switch self {
        case .minimalistic:
            return MinimalisticThemeStyle().eraseToAnyThemeStyle()
        }
    }

    public struct Asset: Assets {
        public enum ColorAsset: ColorAssets {
            case primaryBody
            case secondaryBody
            case primaryBackground
        }
    }
}

@AddTheme(AppTheme.self)
extension Font { }
@AddTheme(AppTheme.self)
extension Color { }
@AddTheme(AppTheme.self)
extension Image { }
@AddTheme(AppTheme.self)
extension Gradient { }
