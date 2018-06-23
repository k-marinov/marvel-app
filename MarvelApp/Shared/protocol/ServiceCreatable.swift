protocol ServiceCreatable {

    func create(with componentCreatable: ComponentCreatable) -> MarvelCharacterService

}

extension ServiceCreatable {

    func create(with componentCreatable: ComponentCreatable) -> MarvelCharacterService {
        return MarvelCharacterService(with: componentCreatable)
    }

}
