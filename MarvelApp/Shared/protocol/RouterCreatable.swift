protocol RouterCreatable {

    func create(with componentCreatable: ComponentCreatable) -> MarvelAppRouter

    func create(with componentCreatable: ComponentCreatable) -> MarvelCharactersRouter

    func create() -> MarvelCharacterDetailRouter

}

extension RouterCreatable {

    func create(with componentCreatable: ComponentCreatable) -> MarvelAppRouter {
        return MarvelAppRouter(with: componentCreatable)
    }

    func create(with componentCreatable: ComponentCreatable) -> MarvelCharactersRouter {
        return MarvelCharactersRouter(with: componentCreatable)
    }

    func create() -> MarvelCharacterDetailRouter {
        return MarvelCharacterDetailRouter()
    }

}
