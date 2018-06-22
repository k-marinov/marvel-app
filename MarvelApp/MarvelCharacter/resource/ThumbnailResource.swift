struct ThumbnailResource: Resource {

    private var path: String?
    private var imageExtension: String?

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        path = try value.decode(String?.self, forKey: .path)
        imageExtension = try value.decode(String?.self, forKey: .imageExtension)
    }

    func imageUrl() -> String? {
        if !StringUtil.isNilOrEmpty(path) && !StringUtil.isNilOrEmpty(imageExtension) {
            var url = path!
            url.append(".")
            url.append(imageExtension!)
            return url
        }
        return nil
    }

    private enum CodingKeys: String, CodingKey {

        case path

        case imageExtension = "extension"

    }

}
