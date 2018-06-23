protocol RemoteCreatable {

    func create(with componentCreatable: ComponentCreatable) -> MarvelCharacterRemote

}

extension RemoteCreatable {

    func create(with componentCreatable: ComponentCreatable) -> MarvelCharacterRemote {
        return MarvelCharacterRemote(with: componentCreatable)
    }

}
