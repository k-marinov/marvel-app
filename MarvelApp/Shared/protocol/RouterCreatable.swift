protocol RouterCreatable {

    func create(with componentCreatable: ComponentCreatable) -> MarvelAppRouter

    func create() -> MarvelCharactersRouter

    func create() -> MarvelCharacterDetailRouter

}

extension RouterCreatable {

    func create(with componentCreatable: ComponentCreatable) -> MarvelAppRouter {
        return MarvelAppRouter(with: componentCreatable)
    }

    func create() -> MarvelCharactersRouter {
        return MarvelCharactersRouter()
    }

    func create() -> MarvelCharacterDetailRouter {
        return MarvelCharacterDetailRouter()
    }

}
