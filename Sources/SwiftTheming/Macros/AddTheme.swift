@attached(member, names: named(init))
public macro AddTheme<ThemeProfile: Theme>(_ type: ThemeProfile.Type) = #externalMacro(module: "SwiftThemingMacros", type: "AddThemeMacro")

