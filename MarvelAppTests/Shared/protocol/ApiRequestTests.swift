import XCTest

@testable import MarvelApp

class ApiRequestTests: XCTestCase {

    func testAsURLRequest_whenHasInvalidUrl_throwsApiRequestError() {
        let request: MockMarvelCharactersRequest = MockMarvelCharactersRequest(url: "ahrotro:***>$$£$%$5")
        XCTAssertThrowsError(try request.asURLRequest()) { error -> Void in
            let apiRequestError: ApiRequestError = ApiRequestError.invalidUrl(
                "can not create URL invalid with httpRequestUrl=ahrotro:***>$$£$%$5")
            XCTAssertEqual((error as! ApiRequestError), apiRequestError)
        }
    }

    func testAsURLRequest_whenValidUrl_returnsURLRequest() {
        let request: MockMarvelCharactersRequest = MockMarvelCharactersRequest(url: "http://marvel.com/hero/1")
        let contentTypeHeaderValue: String? = try! request.asURLRequest().allHTTPHeaderFields?["Content-Type"]
        let httpMethod: String? = try! request.asURLRequest().httpMethod
        let cachePolicy: URLRequest.CachePolicy = try! request.asURLRequest().cachePolicy
        let timeoutInterval: TimeInterval = try! request.asURLRequest().timeoutInterval

        XCTAssertEqual(contentTypeHeaderValue, "application/json")
        XCTAssertEqual(httpMethod, "GET")
        XCTAssertEqual(cachePolicy, URLRequest.CachePolicy.reloadIgnoringLocalCacheData)
        XCTAssertEqual(timeoutInterval, 30)
    }

    func testResponse_whenHasHttpResponseError_returnsApiErrorNetwork() {
        var apiError: ApiError?
        let request: MockMarvelCharactersRequest = MockMarvelCharactersRequest(url: "http://marvel.com/hero/2")
        let response: HttpResponse = HttpResponseMother.emptyHttpResponse(withStatusCode: -1)

        let expectation = self.expectation(description: "")
        request.response(from: response, onCompleted: { apiResponse in
            expectation.fulfill()
        }, onError: { error in
            apiError = error
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(apiError, ApiError.network)
    }

    func testResponse_whenHasHttpResponseWithStatusCode400_returnsClientError() {
        var apiError: ApiError?
        let request: MockMarvelCharactersRequest = MockMarvelCharactersRequest(url: "http://marvel.com/hero/1")
        let response: HttpResponse = HttpResponseMother.httpResponse(withStatusCode: 400)

        let expectation = self.expectation(description: "")
        request.response(from: response, onCompleted: { apiResponse in
            expectation.fulfill()
        }, onError: { error in
            apiError = error
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(apiError, ApiError.client)
    }

    func testResponse_whenHasHttpResponseWithValidData_returnsApiResponse() {
        var apiError: ApiError?
        var apiResponse: ApiResponse?
        let request: MockMarvelCharactersRequest = MockMarvelCharactersRequest(url: "http://marvel.com/heroes")
        let response: HttpResponse = HttpResponseMother.httpResponse(withStatusCode: 200)

        let expectation = self.expectation(description: "")
        request.response(from: response, onCompleted: { response in
            apiResponse = response
            expectation.fulfill()
        }, onError: { error in
            apiError = error
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertNil(apiError)
        XCTAssertNotNil(apiResponse)
        XCTAssertNotNil(apiResponse?.resource is MarvelCharactersResource)
    }

}
