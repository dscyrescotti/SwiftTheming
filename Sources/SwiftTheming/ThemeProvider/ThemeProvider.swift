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
    }

    // MARK: - color
    /// A method that returns color of a given asset and allows to override the preferred appearance and the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: color
    func color(for asset: Theme.ThemeAsset.ColorAsset, preferredAppearance: PreferredAppearance?, on theme: Theme?) -> Color {
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
    /// A method that returns image of a given asset and allows to override the preferred appearance and the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for image
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: image
    func image(for asset: Theme.ThemeAsset.ImageAsset, preferredAppearance: PreferredAppearance?, on theme: Theme?) -> Image {
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
    /// A method that returns font of a given asset and allows to override the preferred appearance and the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for font
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: font
    func font(for asset: Theme.ThemeAsset.FontAsset, preferredAppearance: PreferredAppearance?, on theme: Theme?) -> Font {
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
    /// A method that returns gradient of a given asset and allows to override the preferred appearance and the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for gradient
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: gradient
    func gradient(for asset: Theme.ThemeAsset.GradientAsset, preferredAppearance: PreferredAppearance?, on theme: Theme?) -> Gradient {
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
        guard self.theme != theme else { return }
        self.theme = theme
        UserDefaults.set(theme, key: .theme)
    }
    
    /// A method to change the preferred appearance of an app
    /// - Parameter appearance: appearance to which the preferred appearance of an app is changed
    public func setPreferredAppearance(with appearance: PreferredAppearance) {
        guard self.preferredAppearance != appearance else { return }
        self.preferredAppearance = appearance
        UserDefaults.set(appearance, key: .preferredAppearance)
    }
    
    internal func changeColorScheme(with colorScheme: ColorScheme) {
        guard self.colorScheme != colorScheme else { return }
        self.colorScheme = colorScheme
    }
}
