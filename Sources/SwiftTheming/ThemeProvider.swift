//
//  File.swift
//  
//
//  Created by Dscyre Scotti on 02/11/2021.
//

import SwiftUI
import Combine

public class ThemeProvider<Theme: Themeable>: ObservableObject {
    @Published public private(set) var theme: Theme
    @Published public private(set) var colorScheme: ColorScheme? = nil
    @Published public private(set) var preferredAppearance: PreferredAppearance
    private var cancellables: Set<AnyCancellable> = []
    
    public init(defaultTheme: Theme, preferredAppearance: PreferredAppearance) {
        self.theme = UserDefaults.get(Theme.self, key: .theme) ?? defaultTheme
        self.preferredAppearance = UserDefaults.get(PreferredAppearance.self, key: .preferredAppearance) ?? preferredAppearance
        self.bind()
    }

    // MARK: - color
    public func color(for asset: Theme.ThemeAsset.ColorAsset) -> Color {
        switch theme.colorSet(for: asset).appearance {
        case .static(let color): return color
        case .dynamic(let light, let dark):
            switch preferredAppearance {
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
    
    public func color(for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance) -> Color {
        switch theme.colorSet(for: asset).appearance {
        case .static(let color): return color
        case .dynamic(let light, let dark):
            switch preferredAppearance {
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
    
    public func color(for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance? = nil, on theme: Theme) -> Color {
        switch theme.colorSet(for: asset).appearance {
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
    
    public func color(for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance? = nil, on theme: Theme?) -> Color {
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
    public func image(for asset: Theme.ThemeAsset.ImageAsset) -> Image {
        switch theme.imageSet(for: asset).appearance {
        case .static(let image): return image
        case .dynamic(let light, let dark):
            switch preferredAppearance {
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
    
    public func image(for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance) -> Image {
        switch theme.imageSet(for: asset).appearance {
        case .static(let image): return image
        case .dynamic(let light, let dark):
            switch preferredAppearance {
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
    
    public func image(for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance? = nil, on theme: Theme) -> Image {
        switch theme.imageSet(for: asset).appearance {
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
    
    public func image(for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance? = nil, on theme: Theme?) -> Image {
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
    public func font(for asset: Theme.ThemeAsset.FontAsset) -> Font {
        switch theme.fontSet(for: asset).appearance {
        case .static(let font): return font
        case .dynamic(let light, let dark):
            switch preferredAppearance {
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
    
    public func font(for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance) -> Font {
        switch theme.fontSet(for: asset).appearance {
        case .static(let font): return font
        case .dynamic(let light, let dark):
            switch preferredAppearance {
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
    
    public func font(for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance? = nil, on theme: Theme) -> Font {
        switch theme.fontSet(for: asset).appearance {
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
    
    public func font(for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance? = nil, on theme: Theme?) -> Font {
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
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset) -> Gradient {
        switch theme.gradientSet(for: asset).appearance {
        case .static(let gradient): return gradient
        case .dynamic(let light, let dark):
            switch preferredAppearance {
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
    
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance) -> Gradient {
        switch theme.gradientSet(for: asset).appearance {
        case .static(let gradient): return gradient
        case .dynamic(let light, let dark):
            switch preferredAppearance {
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
    
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance? = nil, on theme: Theme) -> Gradient {
        switch theme.gradientSet(for: asset).appearance {
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
    
    public func gradient(for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance? = nil, on theme: Theme?) -> Gradient {
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

    public func setTheme(with theme: Theme) {
        self.theme = theme
        UserDefaults.set(theme, key: .theme)
    }
    
    public func setPreferredAppearance(with appearance: PreferredAppearance) {
        self.preferredAppearance = appearance
        UserDefaults.set(appearance, key: .preferredAppearance)
    }
    
    public func changeColorScheme(with colorScheme: ColorScheme) {
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
