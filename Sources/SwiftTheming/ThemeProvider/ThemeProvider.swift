import SwiftUI
import Combine

/// An observable object that manages predefined themes and appearances of an app.
public class ThemeProvider: ObservableObject {
    static var shared: ThemeProvider!

    /// A current theme of an app.
    @Published var theme: any Themes
    /// A current color scheme of an app.
    @Published public private(set) var colorScheme: ColorScheme? = nil
    /// A current preferred appearance of an app.
    @Published public private(set) var preferredAppearance: PreferredAppearance
    private var cancellables: Set<AnyCancellable> = []

    public init<ThemeCategory: Themes>(_ theme: ThemeCategory, _ preferredAppearance: PreferredAppearance) {
        self.theme = UserDefaults.get(ThemeCategory.self, key: .theme) ?? theme
        self.preferredAppearance = UserDefaults.get(PreferredAppearance.self, key: .preferredAppearance) ?? preferredAppearance
        ThemeProvider.shared = self
    }

    // MARK: - color
    /// A method that returns color of a given asset and allows to override the preferred appearance and the current theme optionally.
    /// - Parameters:
    ///   - asset: asset for color
    ///   - preferredAppearance: preferred appearance to override
    ///   - theme: theme to override
    /// - Returns: color
    func color<ThemeCategory: Themes>(for asset: ThemeCategory.Asset.ColorAsset, preferredAppearance: PreferredAppearance?, on theme: ThemeCategory?) -> Color {
        guard let themeCategory = theme ?? (self.theme as? ThemeCategory) else {
            fatalError("The underlying theme category doesn't match with \(ThemeCategory.self).")
        }
        let appearance = themeCategory.theme().colorSet(asset).appearance
        switch appearance {
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
    func image<ThemeCategory: Themes>(for asset: ThemeCategory.Asset.ImageAsset, preferredAppearance: PreferredAppearance?, on theme: ThemeCategory?) -> Image {
        guard let themeCategory = theme ?? (self.theme as? ThemeCategory) else {
            fatalError("The underlying theme category doesn't match with \(ThemeCategory.self).")
        }
        let appearance = themeCategory.theme().imageSet(asset).appearance
        switch appearance {
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
    func font<ThemeCategory: Themes>(for asset: ThemeCategory.Asset.FontAsset, preferredAppearance: PreferredAppearance?, on theme: ThemeCategory?) -> Font {
        guard let themeCategory = theme ?? (self.theme as? ThemeCategory) else {
            fatalError("The underlying theme category doesn't match with \(ThemeCategory.self).")
        }
        let appearance = themeCategory.theme().fontSet(asset).appearance
        switch appearance {
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
    func gradient<ThemeCategory: Themes>(for asset: ThemeCategory.Asset.GradientAsset, preferredAppearance: PreferredAppearance?, on theme: ThemeCategory?) -> Gradient {
        guard let themeCategory = theme ?? (self.theme as? ThemeCategory) else {
            fatalError("The underlying theme category doesn't match with \(ThemeCategory.self).")
        }
        let appearance = themeCategory.theme().gradientSet(asset).appearance
        switch appearance {
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
    public func setTheme<ThemeCategory: Themes>(with theme: ThemeCategory) {
        guard self.theme.id != theme.id else { return }
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

    /// A method to change the color scheme when the system changes color scheme
    /// - Parameter colorScheme: current color scheme of the system
    internal func changeColorScheme(with colorScheme: ColorScheme?) {
        guard self.colorScheme != colorScheme else { return }
        self.colorScheme = colorScheme
    }
}
