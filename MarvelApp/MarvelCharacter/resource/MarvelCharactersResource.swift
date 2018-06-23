struct MarvelCharactersResource: Resource {

    private var data: MarvelCharactersDataResource!

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        data = try value.decode(MarvelCharactersDataResource.self, forKey: .data)
    }

    func characters() -> [MarvelCharacterResource] {
        return data.characters
    }

    private enum CodingKeys: String, CodingKey {

        case data

    }

}
