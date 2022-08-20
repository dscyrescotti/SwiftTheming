import SwiftUI

@available(iOS, introduced: 14.0, deprecated, renamed: "ThemedColor")
@available(macOS, introduced: 11.0, deprecated, renamed: "ThemedColor")
@available(tvOS, introduced: 14.0, deprecated, renamed: "ThemedColor")
@available(watchOS, introduced: 7.0, deprecated, renamed: "ThemedColor")
public struct ThemedColorView: View {
    private let asset: ColorAssetable
    
    @ThemeProviding private var themeProvider
    @Environment(\.preferredAppearance) var preferredAppearance
    @Environment(\.preferredTheme) var preferredTheme
    
    private let _opacity: Double
    
    public init(_ asset: ColorAssetable) {
        self.init(asset: asset)
    }
    
    public var body: some View {
        Color(
            on: themeProvider,
            for: asset,
            preferredAppearance: preferredAppearance,
            theme: preferredTheme
        ).opacity(_opacity)
    }
}

extension ThemedColorView {
    internal init(
        asset: ColorAssetable,
        opacity: Double = 1
    ) {
        self.asset = asset
        self._opacity = opacity
    }
    
    public func opacity(_ opacity: Double) -> ThemedColorView {
        ThemedColorView(asset: asset, opacity: opacity)
    }
}
