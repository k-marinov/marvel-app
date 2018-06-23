import Foundation

class MarvelCharactersViewModel: ViewModel {

    private var marvelCharactersService: MarvelCharacterService

    required init(with componentCreatable: ComponentCreatable) {
        marvelCharactersService = componentCreatable.create(with: componentCreatable)
    }

    func loadAllMarvelCharacters(
        with request: MarvelCharactersRequest,
        onStarted: @escaping () -> Void,
        onCompleted: @escaping () -> Void,
        onError: @escaping () -> Void) {

        onStarted()
        marvelCharactersService.findAllMarvelCharacters(
            with: MarvelCharactersRequest(),
            onCompleted: { [weak self] newMarvelCharacters in
                self?.onMainQueue {
                    onCompleted()
                }
        }, onError: { [weak self]  apiError in
            self?.onMainQueue {
                onError()
            }
        })
    }

}
