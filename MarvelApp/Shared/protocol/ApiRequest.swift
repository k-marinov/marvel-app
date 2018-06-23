import Foundation

protocol ApiRequest {

    func httpRequestUrl() -> String

    func httpMethod() -> HttpMethod

    func asURLRequest() throws -> URLRequest

    func response(from newResponse: HttpResponse) -> ApiResponse

    func response(
        from newResponse: HttpResponse,
        onCompleted: @escaping (_ apiResponse: ApiResponse) -> Void,
        onError: @escaping (_ apiError: ApiError) -> Void)

}

extension ApiRequest {

    func asURLRequest() throws -> URLRequest {
        return createUrlRequest(withUrl: try createUrl())
    }

    func response(
        from newResponse: HttpResponse,
        onCompleted: @escaping (_ apiResponse: ApiResponse) -> Void,
        onError: @escaping (_ apiError: ApiError) -> Void)  {

        if newResponse.error == nil {
            let apiResponse: ApiResponse = self.response(from: newResponse)
            if apiResponse.isSuccess() {
                onCompleted(apiResponse)
            } else {
                onError(apiResponse.apiFailError())
            }
        } else {
            onError(ApiError.network)
        }
    }

    private func createUrl() throws -> URL {
        let url: URL? = URL(string: httpRequestUrl())
        if url == nil {
            throw ApiRequestError.invalidUrl("can not create URL invalid with httpRequestUrl=\(httpRequestUrl())")
        }
        return url!
    }

    private func createUrlRequest(withUrl url: URL) -> URLRequest {
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        urlRequest.timeoutInterval = 30.0
        urlRequest.httpMethod = httpMethod().rawValue
        appendHttpHeaders(toUrlRequest: &urlRequest)
        return urlRequest
    }

    private func appendHttpHeaders(toUrlRequest  urlRequest: inout URLRequest) {
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }

}
