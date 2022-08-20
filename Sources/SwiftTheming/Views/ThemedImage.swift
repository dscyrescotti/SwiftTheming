import SwiftUI

public struct ThemedImage: View {
    private let asset: ImageAssetable
    
    @ThemeProviding private var themeProvider
    @Environment(\.preferredAppearance) var preferredAppearance
    @Environment(\.preferredTheme) var preferredTheme
    
    private let _resizable: (capInsets: EdgeInsets, resizingMode: Image.ResizingMode)
    private let _interpolation: Image.Interpolation
    private let _isAntialiased: Bool
    private let _renderingMode: Image.TemplateRenderingMode?
    
    public init(_ asset: ImageAssetable) {
        self.init(asset: asset)
    }
    
    public var body: some View {
        themeProvider.image(for: asset, preferredAppearance: preferredAppearance, on: preferredTheme)
            .resizable(capInsets: _resizable.capInsets, resizingMode: _resizable.resizingMode)
            .interpolation(_interpolation)
            .antialiased(_isAntialiased)
            .renderingMode(_renderingMode)
    }
}

extension ThemedImage {
    internal init(
        asset: ImageAssetable,
        resizable: (capInsets: EdgeInsets, resizingMode: Image.ResizingMode) = (EdgeInsets(), .stretch),
        interpolation: Image.Interpolation = .none,
        isAntialiased: Bool = false,
        renderingMode: Image.TemplateRenderingMode? = .none
    ) {
        self.asset = asset
        self._resizable = resizable
        self._interpolation = interpolation
        self._isAntialiased = isAntialiased
        self._renderingMode = renderingMode
    }
    
    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> ThemedImage {
        ThemedImage(
            asset: asset,
            resizable: (capInsets, resizingMode),
            interpolation: _interpolation,
            isAntialiased: _isAntialiased,
            renderingMode: _renderingMode
        )
    }
    
    public func interpolation(_ interpolation: Image.Interpolation) -> ThemedImage {
        ThemedImage(
            asset: asset,
            resizable: _resizable,
            interpolation: interpolation,
            isAntialiased: _isAntialiased,
            renderingMode: _renderingMode
        )
    }

    public func antialiased(_ isAntialiased: Bool) -> ThemedImage {
        ThemedImage(
            asset: asset,
            resizable: _resizable,
            interpolation: _interpolation,
            isAntialiased: isAntialiased,
            renderingMode: _renderingMode
        )
    }
    
    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> ThemedImage {
        ThemedImage(
            asset: asset,
            resizable: _resizable,
            interpolation: _interpolation,
            isAntialiased: _isAntialiased,
            renderingMode: renderingMode
        )
    }
}
