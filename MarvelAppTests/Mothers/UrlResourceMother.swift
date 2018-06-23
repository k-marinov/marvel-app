import Foundation

@testable import MarvelApp

class UrlResourceMother {

    class func urlDetailResource() -> UrlResource {
        let data: Data =
            """
        {
            "type":"detail",
            "url":"http://marvel.com/comics/characters/1011960/tippy_toe?utm_campaign=apiRef&utm_source=ff3d4847092294acc724123682af904b"
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(UrlResource.self, from: data)
    }

    class func urlWikiResource() -> UrlResource {
        let data: Data =
            """
        {
            "type":"wiki",
            "url":"http://marvel.com/comics/characters/1011960/tippy_toe?utm_campaign=apiRef&utm_source=ff3d4847092294acc724123682af904b"
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(UrlResource.self, from: data)
    }

    class func emptyUrlResource() -> UrlResource {
        let data: Data =
            """
        {
            "type":"",
            "url":""
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(UrlResource.self, from: data)
    }

}
