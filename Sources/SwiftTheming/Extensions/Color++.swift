import SwiftUI

extension Color {
    public init(_ asset: ColorAssetable, appearance: PreferredAppearance? = nil, theme: Theme? = nil) {
        self = ThemeProvider.shared.color(for: asset, preferredAppearance: appearance, on: theme)
    }
}
