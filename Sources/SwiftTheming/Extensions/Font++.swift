import SwiftUI

public extension Font {
    /// A font of a given asset.
    init(on themeProvider: ThemeProvider, for asset: FontAssetable) {
        self = themeProvider.font(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A font of a given asset that allows to override the preferred appearance.
    init(on themeProvider: ThemeProvider, for asset: FontAssetable, preferredAppearance: PreferredAppearance?) {
        self = themeProvider.font(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A font of a given asset that allows to override the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: FontAssetable, theme: Theme?) {
        self = themeProvider.font(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A font of a given asset that allows to override the preferred appearance and the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: FontAssetable, preferredAppearance: PreferredAppearance?, theme: Theme?) {
        self = themeProvider.font(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
}
