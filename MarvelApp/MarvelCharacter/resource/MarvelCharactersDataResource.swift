struct MarvelCharactersDataResource: Resource {

    private(set) var characters: [MarvelCharacterResource] = [MarvelCharacterResource]()

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        characters = try value.decode([MarvelCharacterResource].self, forKey: .results)
    }

    private enum CodingKeys: String, CodingKey {

        case results

    }

}
