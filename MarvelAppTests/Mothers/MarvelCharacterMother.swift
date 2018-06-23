import Foundation

@testable import MarvelApp

class MarvelCharacterMother {

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

    class func marvelCharacterWithoutDescription() -> MarvelCharacterResource {
        let data = FileHelper().createData(fromFilename: "character-1010684", ofType: "json")!
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
