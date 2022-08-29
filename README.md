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

## 📱 Demo
<img src="https://github.com/dscyrescotti/SwiftTheming/blob/main/Assets/demo-app.gif?raw=true" alt="this slowpoke moves"  width="40%"/><br/>
> *You can see the demo project in **Example** folder.*

## 🎉 Motivation 
Imagine that you want to achieve injecting multiple themes and manage them depending on the current system appearance or your preferred appearance. As SwiftUI does not come with the mechanism to manage different themes, you have to come up with it on your own. To me, I want to focus on other time-consuming stuff and don't want to spend on it. So, the idea to implement the handy mechanism for developers came to me and I eventually started crafting it. That was the becoming of **SwiftTheming**. 🎉🎉🎉 Using **SwiftTheming**, we can manage theme and system appearance as you desire without too much sweating. All you have to do is declare your themes with different colors, images, fonts and gradients. Pretty easy!

## ⚠️ Requirements 
- iOS 14+, macOS 11+, watchOS 7+, tvOS 14+

> ***SwiftTheming** is developed using Xcode 13.0. Make sure you are using Xcode 13 and above.*

## 🛠 Installation 
### 📦 Using Swift Package Manager
Add it as a dependency within your `Package.swift`.
```swift
dependencies: [
    .package(url: "https://github.com/dscyrescotti/SwiftTheming.git", from: "2.0.0")
]
```
### 📦 Using Cocoapods
Add it inside your `Podfile`.
```ruby
pod 'SwiftTheming', '~> 2.0.0'
```
> *Currently, SwiftTheming can be installed only via Swift Package Manager and Cocoapods.*

## 👀 Migration guide for Version 2
**SwiftTheming 🎨** has released Version 2 which inlcudes the major enhancement for code architecture and developer experience. Please check out the [migration guide](https://github.com/dscyrescotti/SwiftTheming/blob/main/MigrationGuide.md) to migrate from Version 1.

## 🎯 Usage
### Declaring multiple themes
To get started, you need to define four different types of assets for color, font, gradient and image. Later, they will be used when creating different themes by injecting them as type alias.
```swift
enum ColorAsset: ColorAssetable {
    case backgroundColor
    // more...
}
enum FontAsset: FontAssetable { /* more... */ }
enum GradientAsset: GradientAssetable { /* more... */ }
enum ImageAsset: ImageAssetable { /* more...}
```
> You can omit some assets unless those are intended to use in themes.

Now, we can start designating different themes using the assets declared.
```swift
class SampleTheme: Themed, Assetable {
    typealias _ColorAsset = ColorAsset
    typealias _FontAsset = FontAsset
    typealias _GradientAsset = GradientAsset
    typealias _ImageAsset = ImageAsset

    func colorSet(for asset: ColorAsset) -> ColorSet {
        switch asset {
        case .backgroundColor:
            return ColorSet(light: Color(hex: 0xDEF8EA), dark: Color(hex: 0x22442E))
        }
    }
    func imageSet(for asset: ImageAsset) -> ImageSet { /* some stuff*/ }
    func fontSet(for asset: FontAsset) -> FontSet { /* some stuff */ }
    func gradientSet(for asset: GradientAsset) -> GradientSet { /* some stuff */ }
}
```
> For empty asset, you can directly use `EmptyAsset` instead of declaring an asset.
> ```swift
> class SampleTheme: Themed, Assetable {
>   typealias _GradientAsset = EmptyAsset
> }
> ```

After you create multiple themes, it is time to list down all themes in `Theme` extension that you are going to use in the app and provide the required specification for `Themeable` protocol.
```swift
extension Theme: Themeable {
    static let sampleTheme = Theme(key: "sampleTheme")
    // more themes
    
    public func themed() -> Themed {
        switch self{
        case .sampleTheme: return SampleTheme()
        // some stuff
        default: fatalError("You are accessing undefined theme.")
        }
    }
}
```

### Declaring default theming
Before moving to the part that explains how to use theme providers and access interface elements in view layers, you need to set up the default theme and appearance for the first time running. You can achieve it by letting `DefaultTheming` conforms to `Defaultable` and providing desired theme and appearance which will be used as defaults.
```swift
extension DefaultTheming: Defaultable {
    public func defaultTheme() -> Theme {
        .sampleTheme
    }
    
    public func defaultAppearance() -> PreferredAppearance {
        .system
    }
}
```

### Accessing theme provider across views
Yay! you are ready to use themes in your views. Let's get started passing `ThemeProvider` instance living as an environment object across view hierarchy so that it can be accessible across views.
```swift
WindowGroup {
    ContentView()
        .themeProviding()
}
```
Now, you can access `ThemeProvider` via `@ThemeProviding` property wrapper inside any view so that you can fully manage themes and override the system appearance as you want through `themeProvider`.
```swift
struct ContentView: View {
    @ThemeProviding var themeProvider
    
    var body: some View { /* some stuff */ }
}
```
You can switch theme and appearance by calling `setTheme(with:)` and `setPreferredAppearance(with:)`respectively.

## 🔎 Exploration
To explore more about **SwiftTheming 🎨**, you can check out the [documentation](https://dscyrescotti.github.io/SwiftTheming/documentation/swifttheming/) or dig around the source code.

## ✍️ Author
**Scotti** (**[@dscyrescotti](https://twitter.com/dscyrescotti)**)

## 👨‍💻 Contributions

**SwiftTheming 🎨**  welcomes all developers to contribute if you have any idea to enhance and open an issue if you encounter any bug.

## © License

**SwiftTheming 🎨** is available under the MIT license. See the  [LICENSE](https://github.com/dscyrescotti/SwiftTheming/blob/main/LICENSE)  file for more info.