class MarvelCharacterService {


    private var marvelCharacterRemote: MarvelCharacterRemote

    required init(with componentCreatable: ComponentCreatable) {
        marvelCharacterRemote = componentCreatable.create(with: componentCreatable)
    }

    func findAllMarvelCharacters(
        with request: MarvelCharactersRequest,
        onCompleted: @escaping (_ apiResponse: [MarvelCharacterResource]) -> Void,
        onError: @escaping (_ apiError: ApiError) -> Void) {
        return marvelCharacterRemote.findAllMarvelCharacters(with: request, onCompleted: { marvelCharacters in
            onCompleted(marvelCharacters)
        }, onError: { apiError in
            onError(apiError)
        })
    }

}
