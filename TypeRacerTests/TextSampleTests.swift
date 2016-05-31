import XCTest
@testable import TypeRacer

class TextSampleTests: XCTestCase {

    let testSample = TextSample(text: "Abcdefghijk")

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testMatchesCanCompareCorrectText() {
        let testText = "A"
        let result = testSample.text.matches(testText)

        XCTAssertTrue(result)
    }

    func testMatchesCanCompareIncorrectText() {
        let testText = "b"
        let result = testSample.text.matches(testText)

        XCTAssertFalse(result)
    }


}
