//
//  File.swift
//  
//
//  Created by Dscyre Scotti on 02/11/2021.
//

import SwiftUI
import Combine

class ThemeProvider<Theme: Themeable>: ObservableObject {
    @Published private(set) var theme: Theme
    @Published private(set) var colorScheme: ColorScheme? = nil
    @Published private(set) var preferredAppearance: PreferredAppearance
    private var cancellables: Set<AnyCancellable> = []
    
    init(defaultTheme: Theme, preferredAppearance: PreferredAppearance) {
        self.theme = UserDefaults.get(Theme.self, key: .theme) ?? defaultTheme
        self.preferredAppearance = UserDefaults.get(PreferredAppearance.self, key: .preferredAppearance) ?? preferredAppearance
        self.bind()
    }

    // MARK: - color
    func color(for asset: Theme.ThemeAsset.ColorAsset) -> Color {
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
    
    func color(for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance) -> Color {
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
    
    // MARK: - image
    func image(for asset: Theme.ThemeAsset.ImageAsset) -> Image {
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
    
    func image(for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance) -> Image {
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
    
    // MARK: - font
    func font(for asset: Theme.ThemeAsset.FontAsset) -> Font {
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
    
    func font(for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance) -> Font {
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
    
    // MARK: - gradient
    func gradient(for asset: Theme.ThemeAsset.GradientAsset) -> Gradient {
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
    
    func gradient(for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance) -> Gradient {
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

    func setTheme(with theme: Theme) {
        self.theme = theme
        UserDefaults.set(theme, key: .theme)
    }
    
    func setPreferredAppearance(with appearance: PreferredAppearance) {
        self.preferredAppearance = appearance
        UserDefaults.set(appearance, key: .preferredAppearance)
    }
    
    func changeColorScheme(with colorScheme: ColorScheme) {
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
