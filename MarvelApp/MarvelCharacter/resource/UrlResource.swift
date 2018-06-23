struct UrlResource: Resource {

    private var path: String?
    private var imageExtension: String?

    init(from decoder: Decoder) throws {

    }

    private enum CodingKeys: String, CodingKey {

        case type

        case url

    }

}
