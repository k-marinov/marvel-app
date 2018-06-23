import XCTest

@testable import MarvelApp

class MarvelCharacterResourceTests: XCTestCase {

    func testWebsiteUrl_whenHasEmptyJsonData_returnsEmptyValues() {
        let resource: MarvelCharacterResource = MarvelCharacterMother.emptyMarvelCharacter()
        XCTAssertEqual(resource.name, "")
    }

}
