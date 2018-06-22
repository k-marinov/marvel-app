import XCTest

@testable import MarvelApp

class MarvelCharactersResourceTests: XCTestCase {

    func testInitialize_whenHasEmptyJsonData_returnsEmptyListOfCharacters() {
        let resource: MarvelCharactersResource = MarvelCharacterMother.emptyMarvelCharactersResource()
         XCTAssertEqual(resource.characters().count, 0)
    }

    func testInitialize_whenHasValidJsonData_returnsThreeCharacters() {
        let resource: MarvelCharactersResource = MarvelCharacterMother.marvelCharactersResource()
        XCTAssertEqual(resource.characters().count, 3)
    }

}
