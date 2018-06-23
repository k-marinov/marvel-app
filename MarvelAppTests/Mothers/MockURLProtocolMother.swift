import Foundation
import XCTest

@testable import MarvelApp

class MockURLProtocolMother {

    class func successImageResponse() -> ((URLRequest) throws -> (HTTPURLResponse, Data)) {
        return { request in
            XCTAssertEqual(request.url?.absoluteString.hasPrefix("http://marvel.image/1"), true)
            return (HttpResponseMother.successHttpUrlResponse(),
                    UIImagePNGRepresentation(ImageMother().image1x1())!)
        }
    }

    class func dataNilImageResponse() -> ((URLRequest) throws -> (HTTPURLResponse, Data)) {
        return { request in
            XCTAssertEqual(request.url?.absoluteString.hasPrefix("http://marvel.image/1"), true)
            return (HttpResponseMother.successHttpUrlResponse(), Data(count: 0))
        }
    }

    class func invalidImageDataResponse() -> ((URLRequest) throws -> (HTTPURLResponse, Data)) {
        return { request in
            XCTAssertEqual(request.url?.absoluteString.hasPrefix("http://marvel.image/1"), true)
            return (HttpResponseMother.successHttpUrlResponse(), "{image}".data(using: String.Encoding.utf8)!)
        }
    }

    class func failureImageResponse() -> ((URLRequest) throws -> (HTTPURLResponse, Data)) {
        return { request in
            XCTAssertEqual(request.url?.absoluteString.hasPrefix("http://marvel.image/1"), true)
            return (HttpResponseMother.failureHttpUrlResponse(), Data(count: 0))
        }
    }

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
