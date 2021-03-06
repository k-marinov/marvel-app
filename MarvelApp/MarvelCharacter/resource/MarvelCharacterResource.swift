import Foundation

struct MarvelCharacterResource: Resource, MarvelCharacterCellRepresentable, MarvelCharacterDetailRepresentable {

    private(set) var name: String
    private var description: String
    private var thumbnail: ThumbnailResource
    private(set) var urls: [UrlResource] = [UrlResource]()

    init(from decoder: Decoder) throws {
        let value: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        name = try value.decode(String.self, forKey: .name)
        description = try value.decode(String.self, forKey: .description)
        thumbnail = try value.decode(ThumbnailResource.self, forKey: .thumbnail)
        urls  = try value.decode([UrlResource].self, forKey: .urls)
    }

    func descriptionWithFallback() -> String {
        if StringUtil.isNilOrEmpty(description) {
            return "There is no description for this character".localized()
        }
        return description
    }

    func detailWebsiteUrl() -> URL? {
        let urlString: String? = urls.filter { $0.isDetail() }.first?.websiteUrl()
        if let urlString = urlString,
            let url = URL(string: urlString) {
            return url
        }
        return nil
    }

    func imageUrl() -> URL? {
        if let imageUrl = thumbnail.imageUrl(),
            let url = URL(string: imageUrl) {
            return url
        }
        return nil
    }

    private enum CodingKeys: String, CodingKey {

        case name

        case description

        case thumbnail

        case urls

    }

}
