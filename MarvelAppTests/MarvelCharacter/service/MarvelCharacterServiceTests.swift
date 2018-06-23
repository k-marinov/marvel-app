import XCTest
import Foundation

@testable import MarvelApp

class MarvelCharacterServiceTests: XCTestCase {

    private var creator: MockComponentCreator = MockComponentCreator.buildAllMocks()
    private var service: MarvelCharacterService!

    override func setUp() {
        super.setUp()
        service = MarvelCharacterService(with: creator)
    }

    func testFindAllMarvelCharacters_whenSuccess_returnsListOfCharacters() {
        var marvelCharacters: [MarvelCharacterResource] = [MarvelCharacterResource]()
        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersSuccessResponse()

        let expectation = XCTestExpectation(description: "")
        service.findAllMarvelCharacters(with: MarvelCharactersRequest(), onCompleted: { newMarvelCharacters in
            marvelCharacters.append(contentsOf: newMarvelCharacters)
            expectation.fulfill()
        }, onError: { error in
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)
        
        XCTAssertEqual(marvelCharacters.count, 3)
    }

    func testFindAllMarvelCharacters_whenFail_returnsApiErrorTypeClient() {
        var marvelCharacters: [MarvelCharacterResource] = [MarvelCharacterResource]()
        var apiError: ApiError?
        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersFailureResponse()

        let expectation = XCTestExpectation(description: "")
        service.findAllMarvelCharacters(with: MarvelCharactersRequest(), onCompleted: { newMarvelCharacters in
            marvelCharacters.append(contentsOf: newMarvelCharacters)
            expectation.fulfill()
        }, onError: { error in
            apiError = error
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(apiError, ApiError.client)
        XCTAssertEqual(marvelCharacters.count, 0)
    }

}
