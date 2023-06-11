import Foundation
import SwiftSyntax
import SwiftSyntaxMacros
import SwiftSyntaxBuilder

public struct AddThemeMacro { }

extension AddThemeMacro: MemberMacro {
    static var validTypes: Set<String> = [
        "Font",
        "Color",
        "Image",
        "Gradient"
    ]
    static func validateType(_ type: String) -> Bool {
        guard validTypes.contains(type) else {
            return false
        }
        return true
    }

    public static func expansion<Declaration, Context>(
        of node: AttributeSyntax,
        providingMembersOf declaration: Declaration,
        in context: Context
    ) throws -> [DeclSyntax] where Declaration: DeclGroupSyntax, Context: MacroExpansionContext {
        guard let extensionDecl = declaration.as(ExtensionDeclSyntax.self) else {
            context.diagnose(AddThemeMacroDiagnostic.requiresExtension.diagnose(at: node))
            return []
        }
        let extendedType: String = "\(extensionDecl.extendedType)".replacingOccurrences(of: " ", with: "")
        guard validateType(extendedType) else {
            context.diagnose(AddThemeMacroDiagnostic.requiresSwiftUIView.diagnose(at: node))
            return []
        }
        guard
            case .argumentList(let argument) = node.argument, argument.count == 1,
            let memberAccessExprSyntax = argument.first?.expression.as(MemberAccessExprSyntax.self),
            let themeType = memberAccessExprSyntax.base?.as(IdentifierExprSyntax.self) else {
            context.diagnose(AddThemeMacroDiagnostic.requiresArgument.diagnose(at: node))
            return []
        }
        let assetType = "\(themeType).Asset.\(extendedType)Asset"
        let structInit: DeclSyntax = """
            init(asset: \(raw: assetType), appearance: PreferredAppearance? = nil, theme: \(raw: themeType)? = nil) {
                self = \(raw: extendedType)(asset, appearance: appearance, theme: theme)
            }
        """
        return [structInit]
    }
}
