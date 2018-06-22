import XCTest

@testable import MarvelApp

class ThumbnailResourceTests: XCTestCase {

    func testImageUrl_whenHasEmptyJsonData_returnsNil() {
        let resource: ThumbnailResource = ThumbnailMother.emptyThumbnailResource()
        XCTAssertNil(resource.imageUrl())
    }

    func testImageUrl_whenValidJsonData_returnsImageUrl() {
        let resource: ThumbnailResource = ThumbnailMother.thumbnailResource()
        XCTAssertEqual(resource.imageUrl(), "http://i.annihil.us/u/prod/marvel/i/mg/8/70/4c002efc322e3.jpg")
    }

    func testImageUrl_whenEmptyExtension_returnsNil() {
        let resource: ThumbnailResource = ThumbnailMother.thumbnailWithEmptyExtensionResource()
        XCTAssertNil(resource.imageUrl())
    }

    func testImageUrl_whenEmptyUrl_returnsNil() {
        let resource: ThumbnailResource = ThumbnailMother.thumbnailWithEmptyUrlResource()
        XCTAssertNil(resource.imageUrl())
    }

}
