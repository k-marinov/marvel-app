import Foundation

@testable import MarvelApp

class MarvelCharacterMother {

    class func marvelCharactersResource() -> MarvelCharactersResource {
        return try! JSONDecoder().decode(MarvelCharactersResource.self, from: marvelCharactersData())
    }

    class func emptyMarvelCharactersResource() -> MarvelCharactersResource {
        return try! JSONDecoder().decode(
            MarvelCharactersResource.self,
            from: "{ \"data\": {\"results\": []}}".data(using: .utf8)!)
    }

    class func marvelCharactersData() -> Data {
        return FileHelper().createData(fromFilename: "characters", ofType: "json")!
    }

}
