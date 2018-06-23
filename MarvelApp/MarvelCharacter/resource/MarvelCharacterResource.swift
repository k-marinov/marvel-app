struct MarvelCharacterResource: Resource {

    private(set) var name: String
    private var description: String
    private var thumbnail: ThumbnailResource

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        name = try value.decode(String.self, forKey: .name)
        description = try value.decode(String.self, forKey: .description)
        thumbnail = try value.decode(ThumbnailResource.self, forKey: .thumbnail)

    }

    private enum CodingKeys: String, CodingKey {

        case name

        case description

        case thumbnail

    }

}
