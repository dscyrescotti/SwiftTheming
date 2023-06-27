//
//  AppTheme.swift
//  Demo
//
//  Created by Dscyre Scotti on 6/10/23.
//

import SwiftUI
import SwiftTheming

public enum AppTheme: Theme {
    case minimalistic
    case dynamic(String)

    public var identifier: String {
        switch self {
        case .minimalistic: "minimalistic"
        case .dynamic(let name): name
        }
    }

    public func themeStyle() -> AnyThemeStyle {
        switch self {
        case .minimalistic:
            MinimalisticThemeStyle().eraseToAnyThemeStyle()
        case .dynamic(let name):
            DynamicThemeStyle(on: self, name: name).eraseToAnyThemeStyle()
        }
    }

    public struct Asset: Assets {
        public enum ColorAsset: String, ColorAssets {
            case primaryBody
            case secondaryBody
            case primaryBackground

            public var identifier: String { rawValue }
        }

        public enum ImageAsset: String, ImageAssets {
            case mainBackground

            public var identifier: String { rawValue }
        }

        public enum FontAsset: String, FontAssets {
            case heading

            public var identifier: String { rawValue }
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
