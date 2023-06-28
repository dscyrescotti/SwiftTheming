import Foundation

class ThemeCache {
    static let shared = ThemeCache()

    private init() { }

    var cache: [String: DynamicAssets] = [:]

    static func setTheme(key: String, assets: DynamicAssets) {
        shared.cache[key] = assets
    }

    static func isCachedTheme(key: String) -> Bool {
        shared.cache[key] != nil
    }

    static func colorSet(identifier: String, on themeKey: String) -> ColorSet {
        guard let asset = shared.cache[themeKey] else { return .empty }
        guard let colorAsset = asset.colorAssets[identifier] else { return .empty }
        return colorAsset.colorSet
    }

    static func imageSet(identifier: String, on themeKey: String) -> ImageSet {
        guard let asset = shared.cache[themeKey] else { return .empty }
        guard let imageAssets = asset.imageAssets[identifier] else { return .empty }
        return imageAssets.imageSet
    }

    static func fontSet(identifier: String, on themeKey: String) -> FontSet {
        guard let asset = shared.cache[themeKey] else { return .empty }
        guard let fontAssets = asset.fontAssets[identifier] else { return .empty }
        return fontAssets.fontSet
    }

    static func gradientSet(identifier: String, on themeKey: String) -> GradientSet {
        guard let asset = shared.cache[themeKey] else { return .empty }
        guard let gradientAssets = asset.gradientAssets[identifier] else { return .empty }
        return gradientAssets.gradientSet
    }
}
