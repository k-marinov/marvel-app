import Foundation

@testable import MarvelApp

class MarvelCharacterMother {

    static let description: String = "After the senseless murder of Squirrel Girl’s first partner Monkey Joe, Tippy Toe"
        + " remained by Squirrel Girl’s side and became her new partner."
    static let imageUrl: String = "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
    static let websiteUrl: String = "http://marvel.com/comics/characters/1011960/tippy_toe?utm_campaign="
    + "apiRef&utm_source=ff3d4847092294acc724123682af904b"

    class func emptyMarvelCharacter() -> MarvelCharacterResource {
        let data: Data =
            """
        {
            "id":1010684,
            "name":"",
            "description":"",
            "thumbnail":{
                "path":"",
                "extension":""
            },
            "urls":[]
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(MarvelCharacterResource.self, from: data)
    }

    class func marvelCharacterWithDescription() -> MarvelCharacterResource {
        let data = FileHelper().createData(fromFilename: "character-1011960", ofType: "json")!
        return try! JSONDecoder().decode(MarvelCharacterResource.self, from: data)
    }

    class func marvelCharacterWithoutUrlDetailType() -> MarvelCharacterResource {
        let data: Data =
            """
        {
            "id":1010684,
            "name":"",
            "description":"",
            "thumbnail":{
                "path":"",
                "extension":""
            },
            "urls":[{
            "type":"comiclink",
            "url":"http://website.com/comiclink"
            }, {
            "type":"wiki",
            "url":"http://website.com/wiki"
            }]
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(MarvelCharacterResource.self, from: data)
    }

    class func marvelCharacterWithUrlDetailTypeAndEmptyUrl() -> MarvelCharacterResource {
        let data: Data =
            """
        {
            "id":1010684,
            "name":"",
            "description":"",
            "thumbnail":{
                "path":"",
                "extension":""
            },
            "urls":[{
            "type":"detail",
            "url":""
            }, {
            "type":"wiki",
            "url":"http://website.com/wiki"
            }]
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(MarvelCharacterResource.self, from: data)
    }

    class func marvelCharactersResource() -> MarvelCharactersResource {
        let data = FileHelper().createData(fromFilename: "characters", ofType: "json")!
        return try! JSONDecoder().decode(MarvelCharactersResource.self, from: data)
    }

    class func emptyMarvelCharactersResource() -> MarvelCharactersResource {
        return try! JSONDecoder().decode(
            MarvelCharactersResource.self,
            from: "{ \"data\": {\"results\": []}}".data(using: .utf8)!)
    }

}
