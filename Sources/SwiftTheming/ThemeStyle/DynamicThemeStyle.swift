import Yams
import Foundation

public struct DynamicThemeStyle<ThemeProfile: Theme>: ThemeStyle {
    let name: String
    let theme: ThemeProfile
    let bundle: Bundle

    public init(on theme: ThemeProfile, name: String, bundle: Bundle = .main) {
        self.name = name
        self.theme = theme
        self.bundle = bundle
        loadTheme()
    }

    func loadTheme() {
        guard !ThemeCache.isCachedTheme(key: name) else { return }
        guard let url = bundle.url(forResource: name, withExtension: "yaml") else {
            preconditionFailure("Unable to load theme file named \"\(name).yaml\"")
        }
        guard let data = try? Data(contentsOf: url) else {
            preconditionFailure("Unable to load data from theme file named \"\(name).yaml\"")
        }
        guard let assets = try? YAMLDecoder().decode(DynamicAssets.self, from: data) else {
            preconditionFailure("Unable to load data from theme file named \"\(name).yaml\"")
        }
        ThemeCache.setTheme(key: name, assets: assets)
    }

    public func colorSet(_ asset: ThemeProfile.Asset.ColorAsset) -> ColorSet {
        ThemeCache.colorSet(identifier: asset.identifier, on: name)
    }

    public func imageSet(_ asset: ThemeProfile.Asset.ImageAsset) -> ImageSet {
        ThemeCache.imageSet(identifier: asset.identifier, on: name)
    }

    public func fontSet(_ asset: ThemeProfile.Asset.FontAsset) -> FontSet {
        ThemeCache.fontSet(identifier: asset.identifier, on: name)
    }
}
