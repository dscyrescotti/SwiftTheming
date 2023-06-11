import SwiftSyntax
import SwiftSyntaxMacros
import SwiftSyntaxBuilder

public struct AssetableMacro { }

extension AssetableMacro: ConformanceMacro {
    public static func expansion<Declaration, Context>(
        of node: AttributeSyntax,
        providingConformancesOf declaration: Declaration,
        in context: Context
    ) throws -> [(TypeSyntax, GenericWhereClauseSyntax?)] where Declaration: DeclGroupSyntax, Context: MacroExpansionContext {
        return [("Assets", nil)]
    }
}

extension AssetableMacro: MemberMacro {
    public static func expansion<Declaration, Context>(
        of node: AttributeSyntax,
        providingMembersOf declaration: Declaration,
        in context: Context)
    throws -> [DeclSyntax] where Declaration: DeclGroupSyntax, Context: MacroExpansionContext {
        return []
    }
}
