import XCTest
@testable import TitanRouter

class TitanRouterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(TitanRouter().text, "Hello, World!")
    }


    static var allTests : [(String, (TitanRouterTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
