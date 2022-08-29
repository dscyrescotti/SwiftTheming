<p  align="center">
<img  width="70%" src="https://github.com/dscyrescotti/SwiftTheming/blob/main/Assets/swift-theming-logo.png?raw=true">
</p>

<p align="center">
    <a href="https://swiftpackageindex.com/dscyrescotti/SwiftTheming">
	    <img  src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdscyrescotti%2FSwiftTheming%2Fbadge%3Ftype%3Dplatforms"/> 
    </a>
    <a href="https://swiftpackageindex.com/dscyrescotti/SwiftTheming">
	    <img  src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdscyrescotti%2FSwiftTheming%2Fbadge%3Ftype%3Dswift-versions"/> 
    </a>
    <a href="https://codecov.io/gh/dscyrescotti/SwiftTheming">
	    <img  src="https://codecov.io/gh/dscyrescotti/SwiftTheming/branch/main/graph/badge.svg?token=D7DRKAD0VP"/> 
    </a>
    <a href="https://github.com/dscyrescotti/SwiftTheming/actions/workflows/swift.yml">
     	<img src="https://github.com/dscyrescotti/SwiftTheming/actions/workflows/swift.yml/badge.svg" alt="Action Status"/>
    </a>
    <a href="LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
</p>

**SwiftTheming 🎨** is a handy light-weight handy theme manager which handles multiple themes based on system-wide appearances - light and dark appearances and overrides the system appearance for the application.

## 👀 What's been changed in Version 2?
As Version 2.0.0 is intended to provide a better developer experience, the architecture of the API has been changed as below.

### Declaration of themes
In Version 2, the API comes with `Theme` structure instead of letting developers create their own theme enumeration and inject it as generic type into `ThemeProvider`. To declare multiple themes, it is mandatory to conform to `Themeable` protocol and then extend `Theme` to list down desired themes with unique identifiers.
```swift
extension Theme: Themeable {
    static let bluoTheme = Theme(key: "bluoTheme")
    static let jadoTheme = Theme(key: "jadoTheme")
    
    public func themed() -> Themed {
        switch self {
        case .bluoTheme: return BluoTheme()
        case .jadoTheme: return JadoTheme()
        default: fatalError("You are accessing undefined theme.")
        }
    }
}
```

### Declaration of assets
While all different assets are declared in a single value type conforming to `Assetable` in Version 1, those are now declared separately by conforming to specific asset protocols (`ColorAssetable`, `ImageAssetable`, etc).
```swift
enum ColorAsset: ColorAssetable {
    case backgroundColor
    case accentColor
    case borderColor
    case contentColor
    case fontColor
}

enum FontAsset: FontAssetable {
    case titleFont
    case staticFont
}
```

### Defining default theme and appearance
Although the default theme and appearance are injected through `themeProviding(defaultTheme:defaultAppearance)` in Version 1, it can be done by extending `DefaultTheming` structure with the conformance of `Defaultable` protocol in Version 2.
```swift
extension DefaultTheming: Defaultable {
    public func defaultTheme() -> Theme {
        .bluoTheme
    }
    
    public func defaultAppearance() -> PreferredAppearance {
        .system
    }
}
```
> It is mandatory to declaring those default values. If this declaration is missed in code implementation, the app will crash when running.

### Removal of generic types
Previously, the API mostly relies on generic type passing throughout the call side and it makes developers feel tedious to use. In Version 2, the API no longer relies on those generic types so that `ThemeProvider`, `ThemeProviding` and `Themed` can be used freely without passing generic types.
```swift
// ThemeProviding and ThemeProvider
struct ContentView: View {
    @ThemeProviding var themeProvider
    var body: some View { /* some stuff */ }
}

// Themed
class JadoTheme: Themed, Assetable { 
    // some stuff
}
```

### Injecting assets into themes
As the generic type on `Themed` has been removed, when theme class is created, it is mandatory to conform to `Assetable` protocol and provide required type alias while inheriting `Themed` class.
```swift
class BluoTheme: Themed, Assetable {
    typealias _ColorAsset = ColorAsset
    typealias _FontAsset = EmptyAsset
    typealias _GradientAsset = EmptyAsset
    typealias _ImageAsset = ImageAsset

    func colorSet(for asset: ColorAsset) -> ColorSet { /* some stuff */ }
    
    func imageSet(for asset: ImageAsset) -> ImageSet { /* some stuff */ }
}
```

### Easy access to interface elements
With the revamp of the API, it is no longer complicated and tedious to access interface elements - `Color`, `Image`, `Font` and `Gradient`. The API comes with a handy initializer to create interface element based on asset key.
```swift
struct ContentView: View {
    var body: some View {
        Color(ColorAsset.backgroundColor)
    }
}
```
#### Available initializers
| Interface Element | Description |
| ----------------- | ----------- |
| `Color` |  `init(_:appearance:theme:)`<br>- `asset`: asset for color<br>- `appearance`: preferred appearance to override current appearance (_optional_)<br>- `theme`: preferred theme to override current theme (_optional_) |
| `Font` |  `init(_:appearance:theme:)`<br>- `asset`: asset for font<br>- `appearance`: preferred appearance to override current appearance (_optional_)<br>- `theme`: preferred theme to override current theme (_optional_) |
| `Gradient` |  `init(_:appearance:theme:)`<br>- `asset`: asset for gradient<br>- `appearance`: preferred appearance to override current appearance (_optional_)<br>- `theme`: preferred theme to override current theme (_optional_) |
| `Image` |  `init(_:appearance:theme:)`<br>- `asset`: asset for image<br>- `appearance`: preferred appearance to override current appearance (_optional_)<br>- `theme`: preferred theme to override current theme (_optional_) |

### Utilizing modifiers

Moreover, there are some modifiers which work the same as `SwiftUI` modifiers are provided in the purpose of ease.

#### Available modifiers
| Modifier | Description |
| -------- | ----------- |
| `foregroundColor` | `foregroundColor(_:appearance:theme:)`<br>- `asset`: asset for color<br>- `appearance`: preferred appearance to override current appearance (_optional_)<br>- `theme`: preferred theme to override current theme (_optional_) |
| `background` | `background(_:appearance:theme:)`<br>- `asset`: asset for color<br>- `appearance`: preferred appearance to override current appearance (_optional_)<br>- `theme`: preferred theme to override current theme (_optional_) |
| `font` | `font(_:appearance:theme:)`<br>- `asset`: asset for font<br>- `appearance`: preferred appearance to override current appearance (_optional_)<br>- `theme`: preferred theme to override current theme (_optional_) |

### Migrating `UserDefaults` from Version 1
As the API has been completely changed, it is required to migrate theme data stored in `UserDefaults` when shifting from Version 1 to Version 2. In this regard, the API doesn't provide any method for migration process. However, lucky enough, it can be done by a small piece of code. Here is the sample code for migration process.
```swift
@main
struct MainApp: App {
    // Performing migration process.
    init() {
        let key = UserDefaults.Key.theme
        guard let value = UserDefaults.get(OldTheme.self, key: key) else { return }
        UserDefaults.set(Theme(key: value.key), key: key)
    }
    var body: some Scene { /* some stuff */ }
}

// It is required to store your old themes in your code. 
enum OldTheme: Codable {
    case bluoTheme
    case jadoTheme
    
    var key: String {
        switch self {
        case .bluoTheme: return "bluoTheme"
        case .jadoTheme: return "jadoTheme"
        }
    }
}
```

## 🔎 Exploration
To explore more about **SwiftTheming 🎨**, you can check out the [documentation](https://dscyrescotti.github.io/SwiftTheming/documentation/swifttheming/) or dig around the source code.