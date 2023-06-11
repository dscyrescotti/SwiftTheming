@attached(member, names: named(Asset))
@attached(conformance)
public macro Themeable() = #externalMacro(module: "SwiftThemingMacros", type: "ThemeableMacro")
