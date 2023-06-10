import Foundation

public protocol Theme {
    associatedtype ThemeCategory: Themes

    func fontSet(_ asset: ThemeCategory.Asset.FontAsset) -> FontSet
    func colorSet(_ asset: ThemeCategory.Asset.ColorAsset) -> ColorSet
    func imageSet(_ asset: ThemeCategory.Asset.ImageAsset) -> ImageSet
    func gradientSet(_ asset: ThemeCategory.Asset.GradientAsset) -> GradientSet
}

public extension Theme {
    func fontSet(_ asset: ThemeCategory.Asset.FontAsset) -> FontSet {
        fatalError("\(#function) is not implemented yet.")
    }

    func colorSet(_ asset: ThemeCategory.Asset.ColorAsset) -> ColorSet {
        fatalError("\(#function) is not implemented yet.")
    }

    func imageSet(_ asset: ThemeCategory.Asset.ImageAsset) -> ImageSet {
        fatalError("\(#function) is not implemented yet.")
    }

    func gradientSet(_ asset: ThemeCategory.Asset.GradientAsset) -> GradientSet {
        fatalError("\(#function) is not implemented yet.")
    }
}

public extension Theme {
    func eraseToAnyTheme() -> AnyTheme {
        AnyTheme(self)
    }
}
