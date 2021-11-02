import SwiftUI

public class Themed<Asset: Assetable> {
    public func colorSet(for asset: Asset.ColorAsset) -> ColorSet {
        fatalError("Need to override the \(#function) method.")
    }
    
    public func imageSet(for asset: Asset.ImageAsset) -> ImageSet {
        fatalError("Need to override the \(#function) method.")
    }
    
    public func gradientSet(for asset: Asset.GradientAsset) -> GradientSet {
        fatalError("Need to override the \(#function) method.")
    }
    
    public func fontSet(for asset: Asset.FontAsset) -> FontSet {
        fatalError("Need to override the \(#function) method.")
    }
}
