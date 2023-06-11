import Foundation

public struct AnyThemeStyle {
    let themeStyle: any ThemeStyle
    let fontSet: (any FontAssets) -> FontSet
    let colorSet: (any ColorAssets) -> ColorSet
    let imageSet: (any ImageAssets) -> ImageSet
    let gradientSet: (any GradientAssets) -> GradientSet

    public init<T: ThemeStyle>(_ themeStyle: T) {
        self.themeStyle = themeStyle
        self.fontSet = { asset in
            themeStyle.fontSet(asset as! T.ThemeProfile.Asset.FontAsset)
        }
        self.colorSet = { asset in
            themeStyle.colorSet(asset as! T.ThemeProfile.Asset.ColorAsset)
        }
        self.imageSet = { asset in
            themeStyle.imageSet(asset as! T.ThemeProfile.Asset.ImageAsset)
        }
        self.gradientSet = { asset in
            themeStyle.gradientSet(asset as! T.ThemeProfile.Asset.GradientAsset)
        }
    }
}
