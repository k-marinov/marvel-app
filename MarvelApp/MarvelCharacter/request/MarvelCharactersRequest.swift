import Foundation

class MarvelCharactersRequest: ApiRequest {

    func httpRequestUrl() -> String {
        var url: String = "http://gateway.marvel.com/v1/public/characters"
        url.append("?")
        url.append("ts=1")
        url.append("&apikey=ff3d4847092294acc724123682af904b")
        url.append("&hash=412b0d63f1d175474216fadfcc4e4fed")
        url.append("&limit=25")
        url.append("&orderBy=-modified")
        return url
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
