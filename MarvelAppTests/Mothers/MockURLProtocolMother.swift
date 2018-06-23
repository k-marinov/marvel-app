import Foundation
import XCTest

@testable import MarvelApp

class MockURLProtocolMother {

    class func findAllMarvelCharactersSuccessResponse() -> ((URLRequest) throws -> (HTTPURLResponse, Data)) {
        return { request in
            XCTAssertEqual(request.url?.absoluteString.hasPrefix("http://gateway.marvel.com/v1/public/characters"), true)
            return (HttpResponseMother.successHttpUrlResponse(),
                    MarvelCharacterMother.marvelCharactersJsonData())
        }
    }

    class func findAllMarvelCharactersFailureResponse() -> ((URLRequest) throws -> (HTTPURLResponse, Data)) {
        return { request in
            XCTAssertEqual(request.url?.absoluteString.hasPrefix("http://gateway.marvel.com/v1/public/characters"), true)
            return (HttpResponseMother.failureHttpUrlResponse(), Data())
        }
    }
    
}
