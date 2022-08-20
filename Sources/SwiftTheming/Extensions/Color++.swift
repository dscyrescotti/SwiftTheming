import SwiftUI

public extension Color {
    /// A color of a given asset.
    init(on themeProvider: ThemeProvider, for asset: ColorAssetable) {
        self = themeProvider.color(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A color of a given asset that allows to override the preferred appearance.
    init(on themeProvider: ThemeProvider, for asset: ColorAssetable, preferredAppearance: PreferredAppearance?) {
        self = themeProvider.color(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A color of a given asset that allows to override the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: ColorAssetable, theme: Theme?) {
        self = themeProvider.color(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A color of a given asset that allows to override the preferred appearance and the current theme optionally.
    init(on themeProvider: ThemeProvider, for asset: ColorAssetable, preferredAppearance: PreferredAppearance?, theme: Theme?) {
        self = themeProvider.color(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
}
