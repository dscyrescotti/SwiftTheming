import Foundation

public protocol ThemeStyle {
    associatedtype ThemeProfile: Theme

    func fontSet(_ asset: ThemeProfile.Asset.FontAsset) -> FontSet
    func colorSet(_ asset: ThemeProfile.Asset.ColorAsset) -> ColorSet
    func imageSet(_ asset: ThemeProfile.Asset.ImageAsset) -> ImageSet
    func gradientSet(_ asset: ThemeProfile.Asset.GradientAsset) -> GradientSet
}

public extension ThemeStyle {
    func fontSet(_ asset: ThemeProfile.Asset.FontAsset) -> FontSet {
        fatalError("\(#function) is not implemented yet.")
    }

    func colorSet(_ asset: ThemeProfile.Asset.ColorAsset) -> ColorSet {
        fatalError("\(#function) is not implemented yet.")
    }

    func imageSet(_ asset: ThemeProfile.Asset.ImageAsset) -> ImageSet {
        fatalError("\(#function) is not implemented yet.")
    }

    func gradientSet(_ asset: ThemeProfile.Asset.GradientAsset) -> GradientSet {
        fatalError("\(#function) is not implemented yet.")
    }
}

public extension ThemeStyle {
    func eraseToAnyThemeStyle() -> AnyThemeStyle {
        AnyThemeStyle(self)
    }
}
