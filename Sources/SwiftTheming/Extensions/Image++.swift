import SwiftUI

public extension Image {
    /// An image of a given asset.
    init(on themeProvider: ThemeProvider, for asset: ImageAssetable) {
        self = themeProvider.image(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// An image of a given asset that allows to override the preferred appearance.
    init(on themeProvider: ThemeProvider, for asset: ImageAssetable, preferredAppearance: PreferredAppearance?) {
        self = themeProvider.image(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// An image of a given asset that allows to override the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: ImageAssetable, theme: Theme?) {
        self = themeProvider.image(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// An image of a given asset that allows to override the preferred appearance and the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: ImageAssetable, preferredAppearance: PreferredAppearance?, theme: Theme?) {
        self = themeProvider.image(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
}
