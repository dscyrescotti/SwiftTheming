import SwiftUI

extension Font {
    public init(_ asset: FontAssetable, appearance: PreferredAppearance? = nil, theme: Theme? = nil) {
        self = ThemeProvider.shared.font(for: asset, preferredAppearance: appearance, on: theme)
    }
}
