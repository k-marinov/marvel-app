import Foundation

@testable import MarvelApp

class ThumbnailMother {

    class func thumbnailResource() -> ThumbnailResource {
        let data: Data =
        """
        {
         "path": "http://i.annihil.us/u/prod/marvel/i/mg/8/70/4c002efc322e3",
         "extension": "jpg"
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(ThumbnailResource.self, from: data)
    }

    class func thumbnailWithEmptyExtensionResource() -> ThumbnailResource {
        let data: Data =
            """
        {
         "path": "http://i.annihil.us/u/prod/marvel/i/mg/8/70/4c002efc322e3",
         "extension": ""
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(ThumbnailResource.self, from: data)
    }

    class func thumbnailWithEmptyUrlResource() -> ThumbnailResource {
        let data: Data =
            """
        {
         "path": "",
         "extension": "jpg"
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(ThumbnailResource.self, from: data)
    }

    class func emptyThumbnailResource() -> ThumbnailResource {
        let data: Data =
            """
        {
         "path": "",
         "extension": ""
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(ThumbnailResource.self, from: data)
    }

}
