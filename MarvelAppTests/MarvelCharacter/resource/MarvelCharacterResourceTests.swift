import XCTest

@testable import MarvelApp

class MarvelCharacterResourceTests: XCTestCase {

    func testInitialize_whenHasEmptyJsonData_returnsResourceWithDefaultValues() {
        let resource: MarvelCharacterResource = MarvelCharacterMother.emptyMarvelCharacter()
        XCTAssertEqual(resource.name, "")
        XCTAssertEqual(resource.descriptionWithFallback(), "There is no description for this character".localized())
        XCTAssertNil(resource.imageUrl())
        XCTAssertNil(resource.detailWebsiteUrl())
    }

}
