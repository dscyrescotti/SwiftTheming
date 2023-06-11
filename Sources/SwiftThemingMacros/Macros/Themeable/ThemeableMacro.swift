import SwiftSyntax
import SwiftSyntaxMacros
import SwiftSyntaxBuilder

public struct ThemeableMacro { }

extension ThemeableMacro: ConformanceMacro {
    public static func expansion<Declaration, Context>(
        of node: AttributeSyntax,
        providingConformancesOf declaration: Declaration,
        in context: Context
    ) throws -> [(TypeSyntax, GenericWhereClauseSyntax?)] where Declaration: DeclGroupSyntax, Context: MacroExpansionContext {
        guard let _ = declaration.as(EnumDeclSyntax.self) else {
            context.diagnose(ThemeableMacroDiagnostic.requiresEnum.diagnose(at: node))
            return []
        }
        return [("Theme", nil)]
    }
}

extension ThemeableMacro: MemberMacro {
    public static func expansion<Declaration, Context>(
        of node: AttributeSyntax,
        providingMembersOf declaration: Declaration,
        in context: Context
    ) throws -> [DeclSyntax] where Declaration: DeclGroupSyntax, Context: MacroExpansionContext {
        let assetStruct: DeclSyntax = """
        @Assetable
        public struct Asset {
        }
        """
        return [assetStruct]
    }
}
