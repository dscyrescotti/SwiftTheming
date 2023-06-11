import SwiftSyntax
import SwiftDiagnostics
import SwiftSyntaxMacros
import SwiftSyntaxBuilder

enum AddThemeMacroDiagnostic {
    case requiresExtension
    case requiresSwiftUIView
    case requiresArgument
}

extension AddThemeMacroDiagnostic: DiagnosticMessage {
    func diagnose(at node: some SyntaxProtocol) -> Diagnostic {
        Diagnostic(node: Syntax(node), message: self)
    }

    var message: String {
        switch self {
        case .requiresExtension:
            "'AddTheme' macro can only be applied to an extension"
        case .requiresSwiftUIView:
            "'AddTheme' macro can only be applied to SwiftUI views - Color, Font, Image and Gradient"
        case .requiresArgument:
            "'AddTheme' macro requires the type conforming to 'Themes' protocol as an argument"
        }
    }

    var severity: DiagnosticSeverity { .error }

    var diagnosticID: MessageID {
        MessageID(domain: "Swift", id: "AddTheme.\(self)")
    }
}
