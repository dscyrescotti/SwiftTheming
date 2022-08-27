import SwiftUI

extension Image {
    public init(_ asset: ImageAssetable, appearance: PreferredAppearance? = nil, theme: Theme? = nil) {
        self = ThemeProvider.shared.image(for: asset, preferredAppearance: appearance, on: theme)
    }
}
