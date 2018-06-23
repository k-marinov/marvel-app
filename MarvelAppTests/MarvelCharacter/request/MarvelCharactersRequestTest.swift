import XCTest

@testable import MarvelApp

class MarvelCharactersRequestTest: XCTestCase {

    func testHttpRequestUrl_whenHasValue_returnsUrl() {
        let expectedUrl: String = "http://gateway.marvel.com/v1/public/characters?ts=1&" +
        "apikey=ff3d4847092294acc724123682af904b&hash=412b0d63f1d175474216fadfcc4e4fed&limit=25&orderBy=-modified"
        XCTAssertEqual(MarvelCharactersRequest().httpRequestUrl(), expectedUrl)
    }

    func testHttpMethod_whenHasValue_returnsHttpMethodGet() {
        XCTAssertEqual(MarvelCharactersRequest().httpMethod(), HttpMethod.get)
    }

    func testResource_whenHasValidData_returnsMarvelCharactersResource() {
        let httpResponse: HttpResponse = HttpResponseMother.httpResponse(withStatusCode: 200)
        let response: ApiResponse = MarvelCharactersRequest().response(from: httpResponse)

        XCTAssertTrue(response.resource is MarvelCharactersResource)
    }

    func testResource_whenHasEmptyData_returnsNil() {
        let httpResponse: HttpResponse = HttpResponseMother.emptyHttpResponse(withStatusCode: 200)
        let response: ApiResponse = MarvelCharactersRequest().response(from: httpResponse)

        XCTAssertNil(response.resource)
    }

    func testIsSuccess_whenHttpResponseCodeIsEqualToSuccessCode_returnsTrue() {
        let httpResponse: HttpResponse = HttpResponseMother.emptyHttpResponse(withStatusCode: 200)
        let response: ApiResponse = MarvelCharactersRequest().response(from: httpResponse)

        XCTAssertTrue(response.isSuccess())
    }

    func testIsSuccess_whenHasStatusCode401_returnsTrue() {
        let httpResponse: HttpResponse = HttpResponseMother.emptyHttpResponse(withStatusCode: 401)
        let response: ApiResponse = MarvelCharactersRequest().response(from: httpResponse)

        XCTAssertFalse(response.isSuccess())
    }

}
