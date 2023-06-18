import SwiftSyntaxMacros
import SwiftCompilerPlugin

@main
struct SwiftThemingPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        AddThemeMacro.self
    ]
}
