import XCTest

@testable import MarvelApp

class UrlResourceTests: XCTestCase {

    func testWebsiteUrl_whenHasEmptyJsonData_returnsNil() {
        let resource: UrlResource = UrlResourceMother.emptyUrlResource()
        XCTAssertNil(resource.websiteUrl())
    }

    func testWebsiteUrl_whenValidJsonData_returnsUrl() {
        let resource: UrlResource = UrlResourceMother.urlDetailResource()
        let expectedUrl: String = "http://marvel.com/comics/characters/1011960/tippy_toe?utm_campaign=apiRef&"
            + "utm_source=ff3d4847092294acc724123682af904b"
        XCTAssertEqual(resource.websiteUrl(), expectedUrl)
    }

    func testIsDetail_whenHasEmptyJsonData_returnsFalse() {
        let resource: UrlResource = UrlResourceMother.emptyUrlResource()
        XCTAssertFalse(resource.isDetail())
    }

    func testIsDetail_whenHasTypeDetail_returnsTrue() {
        let resource: UrlResource = UrlResourceMother.urlDetailResource()
        XCTAssertTrue(resource.isDetail())
    }

    func testIsDetail_whenHasTypeWiki_returnsFalse() {
        let resource: UrlResource = UrlResourceMother.urlWikiResource()
        XCTAssertFalse(resource.isDetail())
    }

}
