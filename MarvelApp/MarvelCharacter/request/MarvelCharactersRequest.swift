import Foundation

class MarvelCharactersRequest: ApiRequest {

    func httpRequestUrl() -> String {
        return "http://linxmap.com/marvel/heroes.json"
    }

    func httpMethod() -> HttpMethod {
        return HttpMethod.get
    }

    func response(from newResponse: HttpResponse) -> ApiResponse {
        return ApiResponse(
            resourceType: MarvelCharactersResource.self,
            httpResponse: newResponse,
            successHttpStatusCode: HttpStatusCode.ok)
    }

}
