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

    func testInitialize_whenHasValidJsonData_returnsResourceWithDecodedValues() {
        let resource: MarvelCharacterResource = MarvelCharacterMother.marvelCharacterWithDescription()
        XCTAssertEqual(resource.name, "Tippy Toe")
        XCTAssertEqual(resource.descriptionWithFallback(), MarvelCharacterMother.description)
        XCTAssertEqual(resource.imageUrl(), MarvelCharacterMother.imageUrl)
        XCTAssertEqual(resource.detailWebsiteUrl(), URL(string: MarvelCharacterMother.websiteUrl))
    }

    func testDetailWebsiteUrl_whenDoesNotHaveUrlWithDetailType_returnsNil() {
        let resource: MarvelCharacterResource = MarvelCharacterMother.marvelCharacterWithoutUrlDetailType()
        XCTAssertNil(resource.detailWebsiteUrl())
    }

    func testDetailWebsiteUrl_whenHasUrlWithDetailTypeAndEmptyUrl_returnsNil() {
        let resource: MarvelCharacterResource = MarvelCharacterMother.marvelCharacterWithUrlDetailTypeAndEmptyUrl()
        XCTAssertNil(resource.detailWebsiteUrl())
    }

}
