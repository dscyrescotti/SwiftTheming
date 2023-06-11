@attached(member, names: named(init))
public macro AddTheme<ThemeCategory: Themes>(_ type: ThemeCategory.Type) = #externalMacro(module: "SwiftThemingMacros", type: "AddThemeMacro")

