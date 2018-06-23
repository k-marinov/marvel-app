import Foundation

class ApiClient {

    private let httpClient: HttpClient

    required init(with componentCreatable: ComponentCreatable) {
        httpClient = componentCreatable.create()
    }

    func request(
        with request: ApiRequest,
        onCompleted: @escaping (_ apiResponse: ApiResponse) -> Void,
        onError: @escaping (_ apiError: ApiError) -> Void) {
        return httpClient.request(
            urlRequest: try! request.asURLRequest(),
            onCompleted: { httpResponse in
                request.response(from: httpResponse, onCompleted: {
                    apiResponse in onCompleted(apiResponse)
                }, onError: {
                    apiError in onError(apiError)
                })
        })
    }

}
