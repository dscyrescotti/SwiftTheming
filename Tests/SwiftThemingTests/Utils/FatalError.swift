import XCTest
@testable import SwiftTheming

extension XCTestCase {
    func expectFatalError(expectedMessage: String, testcase: @escaping () -> Void) {
        let expectation = self.expectation(description: "expectingFatalError")
        var assertionMessage: String? = nil
        FatalError.replaceFatalError { message, _, _ in
            assertionMessage = message
            expectation.fulfill()
            self.unreachable()
        }
        DispatchQueue.global(qos: .userInitiated).async(execute: testcase)
        waitForExpectations(timeout: 2) { _ in
            XCTAssertEqual(assertionMessage, expectedMessage)
            FatalError.restoreFatalError()
        }
    }
    
    private func unreachable() -> Never {
        repeat {
            RunLoop.current.run()
        } while (true)
    }
}
