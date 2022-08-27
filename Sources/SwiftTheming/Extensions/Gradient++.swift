import SwiftUI

extension Gradient {
    public init(_ asset: GradientAssetable, appearance: PreferredAppearance? = nil, theme: Theme? = nil) {
        self = ThemeProvider.shared.gradient(for: asset, preferredAppearance: appearance, on: theme)
    }
}
