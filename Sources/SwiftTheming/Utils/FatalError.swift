import Foundation

func fatalError(_ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    FatalError.fatalErrorClosure(message(), file, line)
}

struct FatalError {
    static var fatalErrorClosure: (String, StaticString, UInt) -> Never = defaultFatalErrorClosure
    private static let defaultFatalErrorClosure = {
        Swift.fatalError($0, file: $1, line: $2)
    }
    static func replaceFatalError(closure: @escaping (String, StaticString, UInt) -> Never) {
        fatalErrorClosure = closure
    }
    static func restoreFatalError() {
        fatalErrorClosure = defaultFatalErrorClosure
    }
}
