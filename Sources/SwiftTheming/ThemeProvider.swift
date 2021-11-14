//
//  File.swift
//  
//
//  Created by Dscyre Scotti on 02/11/2021.
//

import SwiftUI
import Combine

/// An observable object that manages predefined themes and appearances of an app.
public class ThemeProvider<Theme: Themeable>: ObservableObject {
    /// A current theme of an app.
    @Published public private(set) var theme: Theme
    /// A current color scheme of an app.
    @Published public private(set) var colorScheme: ColorScheme? = nil
    /// A current preferred appearance of an app.
    @Published public private(set) var preferredAppearance: PreferredAppearance
    private var cancellables: Set<AnyCancellable> = []
    
    /// An initializer that takes default theme and preferred appearance for first time running.
    /// - Parameters:
    ///   - defaultTheme: default theme for first time running
    ///   - preferredAppearance: preferred appearance for first time running
    public init(defaultTheme: Theme, preferredAppearance: PreferredAppearance) {
        self.theme = UserDefaults.get(Theme.self, key: .theme) ?? defaultTheme
        self.preferredAppearance = UserDefaults.get(PreferredAppearance.self, key: .preferredAppearance) ?? preferredAppearance
        self.bind()
    }

    // MARK: - color
    /// A method that returns color of a given asset.
    /// - Parameter asset: asset for color
    /// - Returns: color
    public func color(for asset: Theme.ThemeAsset.ColorAsset) -> Color {
        self.color(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A method that returns color of a given asset and allows to override the preferred appearance.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - preferredAppearance: preferred appearance to override
    /// - Returns: color
    public func color(for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance) -> Color {
        self.color(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A method that returns color of a given asset and allows to override the preferred appearance optionally.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - preferredAppearance: preferred appearance to override
    /// - Returns: color
    public func color(for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance?) -> Color {
        self.color(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A method that returns color of a given asset and allows to override the current theme.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - theme: theme to override
    /// - Returns: color
    public func color(for asset: Theme.ThemeAsset.ColorAsset, on theme: Theme) -> Color {
        self.color(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A method that returns color of a given asset and allows to override the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - theme: theme to override
    /// - Returns: color
    public func color(for asset: Theme.ThemeAsset.ColorAsset, on theme: Theme?) -> Color {
        self.color(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A method that returns color of a given asset and allows to override the preferred appearance and the current theme.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: color
    public func color(for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance, on theme: Theme) -> Color {
        self.color(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
    
    /// A method that returns color of a given asset and allows to override the preferred appearance and the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: color
    public func color(for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance?, on theme: Theme?) -> Color {
        switch (theme ?? self.theme).colorSet(for: asset).appearance {
        case .static(let color): return color
        case .dynamic(let light, let dark):
            switch preferredAppearance ?? self.preferredAppearance {
            case .system:
                switch colorScheme {
                case .light: return light
                case .dark: return dark
                case .none: return light
                @unknown default: return light
                }
            case .light:
                return light
            case .dark:
                return dark
            }
        }
    }
    
    // MARK: - image
    /// A method that returns image of a given asset.
    /// - Parameter asset: asset for image
    /// - Returns: image
    public func image(for asset: Theme.ThemeAsset.ImageAsset) -> Image {
        self.image(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A method that returns image of a given asset and allows to override the preferred appearance.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - preferredAppearance: preferred appearance to override
    /// - Returns: image
    public func image(for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance) -> Image {
        self.image(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A method that returns image of a given asset and allows to override the preferred appearance optionally.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - preferredAppearance: preferred appearance to override
    /// - Returns: image
    public func image(for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance?) -> Image {
        self.image(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A method that returns image of a given asset and allows to override the current theme.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - theme: theme to override
    /// - Returns: image
    public func image(for asset: Theme.ThemeAsset.ImageAsset, on theme: Theme) -> Image {
        self.image(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A method that returns image of a given asset and allows to override the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - theme: theme to override
    /// - Returns: image
    public func image(for asset: Theme.ThemeAsset.ImageAsset, on theme: Theme?) -> Image {
        self.image(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A method that returns image of a given asset and allows to override the preferred appearance and the current theme.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: image
    public func image(for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance, on theme: Theme) -> Image {
        self.image(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
    
    /// A method that returns image of a given asset and allows to override the preferred appearance and the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: image
    public func image(for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance?, on theme: Theme?) -> Image {
        switch (theme ?? self.theme).imageSet(for: asset).appearance {
        case .static(let image): return image
        case .dynamic(let light, let dark):
            switch preferredAppearance ?? self.preferredAppearance {
            case .system:
                switch colorScheme {
                case .light: return light
                case .dark: return dark
                case .none: return light
                @unknown default: return light
                }
            case .light:
                return light
            case .dark:
                return dark
            }
        }
    }
    
    // MARK: - font
    /// A method that returns font of a given asset.
    /// - Parameter asset: asset for font
    /// - Returns: font
    public func font(for asset: Theme.ThemeAsset.FontAsset) -> Font {
        self.font(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A method that returns font of a given asset and allows to override the preferred appearance.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - preferredAppearance: preferred appearance to override
    /// - Returns: font
    public func font(for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance) -> Font {
        self.font(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A method that returns font of a given asset and allows to override the preferred appearance optionally.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - preferredAppearance: preferred appearance to override
    /// - Returns: font
    public func font(for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance?) -> Font {
        self.font(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A method that returns font of a given asset and allows to override the current theme.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - theme: theme to override
    /// - Returns: font
    public func font(for asset: Theme.ThemeAsset.FontAsset, on theme: Theme) -> Font {
        self.font(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A method that returns font of a given asset and allows to override the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - theme: theme to override
    /// - Returns: font
    public func font(for asset: Theme.ThemeAsset.FontAsset, on theme: Theme?) -> Font {
        self.font(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A method that returns font of a given asset and allows to override the preferred appearance and the current theme.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: font
    public func font(for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance, on theme: Theme) -> Font {
        self.font(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
    
    /// A method that returns font of a given asset and allows to override the preferred appearance and the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: font
    public func font(for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance?, on theme: Theme?) -> Font {
        switch (theme ?? self.theme).fontSet(for: asset).appearance {
        case .static(let font): return font
        case .dynamic(let light, let dark):
            switch preferredAppearance ?? self.preferredAppearance {
            case .system:
                switch colorScheme {
                case .light: return light
                case .dark: return dark
                case .none: return light
                @unknown default: return light
                }
            case .light:
                return light
            case .dark:
                return dark
            }
        }
    }
    
    // MARK: - gradient
    /// A method that returns gradient of a given asset.
    /// - Parameter asset: asset for gradient
    /// - Returns: gradient
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset) -> Gradient {
        self.gradient(for: asset, preferredAppearance: nil, on: nil)
    }
    
    /// A method that returns gradient of a given asset and allows to override the preferred appearance.
    /// - Parameters:
    ///   - asset: asset for gradient
    ///   - preferredAppearance: preferred appearance to override
    /// - Returns: gradient
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance) -> Gradient {
        self.gradient(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A method that returns gradient of a given asset and allows to override the preferred appearance optionally.
    /// - Parameters:
    ///   - asset: asset for gradient
    ///   - preferredAppearance: preferred appearance to override
    /// - Returns: gradient
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance?) -> Gradient {
        self.gradient(for: asset, preferredAppearance: preferredAppearance, on: nil)
    }
    
    /// A method that returns gradient of a given asset and allows to override the current theme.
    /// - Parameters:
    ///   - asset: asset for gradient
    ///   - theme: theme to override
    /// - Returns: gradient
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset, on theme: Theme) -> Gradient {
        self.gradient(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A method that returns gradient of a given asset and allows to override the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for gradient
    ///   - theme: theme to override
    /// - Returns: gradient
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset, on theme: Theme?) -> Gradient {
        self.gradient(for: asset, preferredAppearance: nil, on: theme)
    }
    
    /// A method that returns gradient of a given asset and allows to override the preferred appearance and the current theme.
    /// - Parameters:
    ///   - asset: asset for gradient
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: gradient
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance, on theme: Theme) -> Gradient {
        self.gradient(for: asset, preferredAppearance: preferredAppearance, on: theme)
    }
    
    /// A method that returns gradient of a given asset and allows to override the preferred appearance and the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for gradient
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: gradient
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance?, on theme: Theme?) -> Gradient {
        switch (theme ?? self.theme).gradientSet(for: asset).appearance {
        case .static(let gradient): return gradient
        case .dynamic(let light, let dark):
            switch preferredAppearance ?? self.preferredAppearance {
            case .system:
                switch colorScheme {
                case .light: return light
                case .dark: return dark
                case .none: return light
                @unknown default: return light
                }
            case .light:
                return light
            case .dark:
                return dark
            }
        }
    }
    
    /// A method to change the current theme of an app.
    /// - Parameter theme: theme to which the current theme of an app is changed
    public func setTheme(with theme: Theme) {
        self.theme = theme
        UserDefaults.set(theme, key: .theme)
    }
    
    /// A method to change the preferred appearance of an app
    /// - Parameter appearance: appearance to which the preferred appearance of an app is changed
    public func setPreferredAppearance(with appearance: PreferredAppearance) {
        self.preferredAppearance = appearance
        UserDefaults.set(appearance, key: .preferredAppearance)
    }
    
    internal func changeColorScheme(with colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
    }
    
    private func bind() {
        $colorScheme
            .dropFirst()
            .removeDuplicates()
            .sink { [unowned self] _ in
                self.objectWillChange.send()
            }
            .store(in: &cancellables)
        $theme
            .removeDuplicates()
            .sink { [unowned self] _ in
                self.objectWillChange.send()
            }
            .store(in: &cancellables)
        $preferredAppearance
            .removeDuplicates()
            .sink { [unowned self] _ in
                self.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}
