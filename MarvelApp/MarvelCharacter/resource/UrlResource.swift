struct UrlResource: Resource {

    private var detail: String?
    private var url: String?

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        detail = try value.decode(String?.self, forKey: .type)
        url = try value.decode(String?.self, forKey: .url)
    }

    func websiteUrl() -> String? {
        if StringUtil.isNilOrEmpty(url) {
            return nil
        }
        return url!
    }

    func isDetail() -> Bool {
        return !StringUtil.isNilOrEmpty(detail) && detail! == "detail"
    }

    private enum CodingKeys: String, CodingKey {

        case type

        case url

    }

}
