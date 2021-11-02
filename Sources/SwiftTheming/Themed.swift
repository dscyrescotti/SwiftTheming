import SwiftUI

class Themed<Asset: Assetable> {
    func colorSet(for asset: Asset.ColorAsset) -> ColorSet {
        fatalError("Need to override the \(#function) method.")
    }
    
    func imageSet(for asset: Asset.ImageAsset) -> ImageSet {
        fatalError("Need to override the \(#function) method.")
    }
    
    func gradientSet(for asset: Asset.GradientAsset) -> GradientSet {
        fatalError("Need to override the \(#function) method.")
    }
    
    func fontSet(for asset: Asset.FontAsset) -> FontSet {
        fatalError("Need to override the \(#function) method.")
    }
}
