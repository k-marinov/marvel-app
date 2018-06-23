import Foundation

class MarvelCharacterRemote {

    private let apiClient: ApiClient

    required init(with componentCreatable: ComponentCreatable) {
        apiClient = componentCreatable.create(with: componentCreatable)
    }

    func findAllMarvelCharacters(
        with request: MarvelCharactersRequest,
        onCompleted: @escaping (_ apiResponse: [MarvelCharacterResource]) -> Void,
        onError: @escaping (_ apiError: ApiError) -> Void) {
        return apiClient.request(with: request, onCompleted: { apiResponse in
            let resource: MarvelCharactersResource = apiResponse.resource as! MarvelCharactersResource
            onCompleted(resource.characters())
        }, onError: { apiError in
            onError(apiError)
        })
    }

}
