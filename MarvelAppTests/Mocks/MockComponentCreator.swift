import Foundation

@testable import MarvelApp

class MockComponentCreator: ComponentCreatable {

    var marvelCharacterService: MarvelCharacterService!
    var mockUrlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default

    init() {
    }

    func create() -> HttpClient {
        return HttpClient(urlSessionConfiguration: mockUrlSessionConfiguration)
    }

    func mockMarvelCharacterService() -> MockMarvelCharacterService {
        return marvelCharacterService as! MockMarvelCharacterService
    }

    func create(with componentCreatable: ComponentCreatable) -> MarvelCharacterService {
        return marvelCharacterService
    }

    class func buildAllMocks() -> MockComponentCreator {
        let creator: MockComponentCreator = MockComponentCreator()
        creator.marvelCharacterService = MockMarvelCharacterService(with: creator)

        return creator
    }

}
