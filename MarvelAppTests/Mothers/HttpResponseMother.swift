import Foundation

@testable import MarvelApp

class HttpResponseMother {

    class func httpResponse(withStatusCode statusCode: Int) -> HttpResponse {
        let response: HTTPURLResponse? = HTTPURLResponse(
            url: URL(string: "http://marvel.com")!,
            statusCode: statusCode,
            httpVersion: "1.0",
            headerFields: nil)
        let value: Data = "{ \"data\": {\"results\": []}}".data(using: String.Encoding.utf8)!
        return HttpResponse(response: response, data: value, error: nil)
    }

    class func emptyHttpResponse(withStatusCode statusCode: Int) -> HttpResponse {
        let response: HTTPURLResponse? = HTTPURLResponse(
            url: URL(string: "http://marvel.com")!,
            statusCode: statusCode,
            httpVersion: "1.0",
            headerFields: nil)
        let value: Data = "".data(using: String.Encoding.utf8)!
        return HttpResponse(response: response, data: value, error: NSError(domain: "network error", code: -1, userInfo: nil))
    }

    class func successHttpUrlResponse() -> HTTPURLResponse {
        return HTTPURLResponse(
            url: URL(string: "http://www.marvel.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil)!
    }

    class func failureHttpUrlResponse() -> HTTPURLResponse {
        return HTTPURLResponse(
            url: URL(string: "http://www.marvel.com")!,
            statusCode: 400,
            httpVersion: nil,
            headerFields: nil)!
    }

}
