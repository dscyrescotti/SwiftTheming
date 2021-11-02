import SwiftUI

protocol Themeable: Codable, Equatable {
    associatedtype ThemeAsset: Assetable
    
    func theme() -> Themed<ThemeAsset>
}

extension Themeable {
    internal func colorSet(for asset: ThemeAsset.ColorAsset) -> ColorSet {
        theme().colorSet(for: asset)
    }
    
    internal func imageSet(for asset: ThemeAsset.ImageAsset) -> ImageSet {
        theme().imageSet(for: asset)
    }
    
    internal func gradientSet(for asset: ThemeAsset.GradientAsset) -> GradientSet {
        theme().gradientSet(for: asset)
    }
    
    internal func fontSet(for asset: ThemeAsset.FontAsset) -> FontSet {
        theme().fontSet(for: asset)
    }
}
