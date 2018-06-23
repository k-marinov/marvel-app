import XCTest
import Foundation

@testable import MarvelApp

class MarvelCharacterServiceTests: XCTestCase {

    private var creator: MockComponentCreator = MockComponentCreator.buildAllMocks()
    private var service: MarvelCharacterService!

    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        creator.mockUrlSessionConfiguration = configuration
        service = MarvelCharacterService(with: creator)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFindAllMarvelCharacters_whenSuccess_returnsListOfCharacters() {
        var marvelCharacters: [MarvelCharacterResource] = [MarvelCharacterResource]()
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.absoluteString.hasPrefix("http://gateway.marvel.com/v1/public/characters"), true)
            return (HttpResponseMother.successHttpUrlResponse(),
                    MarvelCharacterMother.marvelCharactersJsonData())
        }

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

    func testFindAllMarvelCharacters_whenFail_returnsEmptyList() {
        var marvelCharacters: [MarvelCharacterResource] = [MarvelCharacterResource]()
        var apiError: ApiError?

        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.absoluteString.hasPrefix("http://gateway.marvel.com/v1/public/characters"), true)
            return (HttpResponseMother.failureHttpUrlResponse(), Data())
        }

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
