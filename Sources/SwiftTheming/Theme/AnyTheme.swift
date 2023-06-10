import Foundation

public struct AnyTheme {
    let theme: any Theme
    let fontSet: (any FontAssets) -> FontSet
    let colorSet: (any ColorAssets) -> ColorSet
    let imageSet: (any ImageAssets) -> ImageSet
    let gradientSet: (any GradientAssets) -> GradientSet

    public init<T: Theme>(_ theme: T) {
        self.theme = theme
        self.fontSet = { asset in
            theme.fontSet(asset as! T.ThemeCategory.Asset.FontAsset)
        }
        self.colorSet = { asset in
            theme.colorSet(asset as! T.ThemeCategory.Asset.ColorAsset)
        }
        self.imageSet = { asset in
            theme.imageSet(asset as! T.ThemeCategory.Asset.ImageAsset)
        }
        self.gradientSet = { asset in
            theme.gradientSet(asset as! T.ThemeCategory.Asset.GradientAsset)
        }
    }
}
