<p  align="center">
<img  width="90%" src="https://github.com/dscyrescotti/SwiftTheming/blob/main/Assets/SwiftTheming.png?raw=true">
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
    <a href="https://github.com/dscyrescotti/CodableX/actions/workflows/swift.yml">
     	<img src="https://github.com/dscyrescotti/SwiftTheming/actions/workflows/swift.yml/badge.svg" alt="Action Status"/>
    </a>
    <a href="LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
</p>

**SwiftTheming 🎨** is a handy lightweight handy theme manager which handles multiple themes based on system-wide appearances - light and dark appearances and overrides the system appearance for the application.

## Demo📱
<img src="https://github.com/dscyrescotti/SwiftTheming/blob/main/Assets/Demo.gif?raw=true" alt="this slowpoke moves"  width="40%"/><br/>
> *You can see the demo project in **Example** folder.*

## Motivation 🎉
Imagine that you want to achieve injecting multiple themes and managing them depending on the current system appearance or your preferred appearance. As SwiftUI does not come with the mechanism to manage different themes, you have to come up with it on your own. To me, I want to focus on other time-consuming stuff and don't want to spend on it. So, the idea to implement the handy mechanism for developers came to me and I eventually started crafting it. That was the becoming of **SwiftTheming**. 🎉🎉🎉 Using **SwiftTheming**, we can manage theme and system appearance as you desire without too much sweating. All you have to do is declare your themes with different colors, images, fonts and gradients. Pretty easy!

## Requirements ⚠️
- iOS 14+, macOS 11+, watchOS 7+, tvOS 14+

***SwiftTheming** is developed using Xcode 13.0. Make sure you are using Xcode 13 and above.*

## Installation 🛠
### Using Swift Package Manager 📦
Add it as a dependency within your `Package.swift`.
```swift
dependencies: [
    .package(url: "https://github.com/dscyrescotti/SwiftTheming.git", from: "1.0.0")
]
```
*Currently, SwiftTheming can be installed only via Swift Package Manager.*

## Usage 📋 
### Defining multiple themes
To get started, you need to declare the abstraction layer of asset that may contain a group of colors, images, gradients and/or fonts. It will be injected into different themes that you create later.
```swift
struct Asset: Assetable {
    enum ColorAsset {
        case backgroundColor
        // more...
    }
    enum ImageAsset { // more... }
    enum FontAsset { // more... }
    enum GradientAsset { // more... }
}
```
Now, we can start designating different themes based on the above asset.
```swift
class SampleTheme: Themed<Asset> {
    override func colorSet(for asset: Asset.ColorAsset) -> ColorSet {
        switch asset {
        case .backgroundColor:
            return ColorSet(light: Color.red, dark: Color.pink)
        }
    }
    override func imageSet(for asset: Asset.ImageAsset) -> ImageSet { // some stuff... }
    override func fontSet(for asset: Asset.FontAsset) -> FontSet { // some stuff... }
    override func gradientSet(for asset: Asset.GradientAsset) -> GradientSet { // some stuff... }
}
```
> Make sure you override the above methods before you call. If not , you will end up with fatal error.

After you create multiple themes, it is time to list down all themes that you are going to use in app.
```swift
enum Theme: Themeable {
    case sampleTheme
    // more...
    
    func theme() -> Themed<Asset> {
        switch self {
        case .sampleTheme: return SampleTheme()
        // more...
        }
    }
}
```
### Accessing theme provider across views
Yay! you are ready to use themes in your views. Let's get started to pass `ThemeProvider` across view hierarchy. Here you can set default theme and default appearance for first time running.
```swift
WindowGroup {
    ContentView()
        .themeProviding(defaultTheme: Theme.sampleTheme, defaultAppearance: .system)
}
```
Now, you can access `ThemeProvider` via `@ThemeProviding` property wrapper inside any view so that you can easily use assets prepopulated by passing it.
```swift
struct ContentView: View {
    @ThemeProviding<Theme> var themeProvider
    
    var body: some View {
        Color(on: themeProvider, for: .backgroundColor)
    }
}
```
### Switching theme and appearance
You can change theme and appearance by calling`setTheme(with:)`and `setPreferredAppearance(with:)`respectively.

## Author 🖋
**Dscyre Scotti** (**[@dscyrescotti](https://twitter.com/dscyrescotti)**)

## Contributions 👨‍💻🧑‍💻👩‍💻

**SwiftTheming 🎨**  welcomes all developers to contribute if you have any idea to enhance and open an issue if you encounter any bug.

## License 📃

**SwiftTheming 🎨** is available under the MIT license. See the  [LICENSE](https://github.com/dscyrescotti/SwiftTheming/blob/main/LICENSE)  file for more info.