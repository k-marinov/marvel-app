import Foundation

@testable import MarvelApp

class MockComponentCreator: ComponentCreatable {

    var marvelCharacterService: MarvelCharacterService!

    init() {
    }

    func create() -> HttpClient {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return HttpClient(urlSessionConfiguration: configuration)
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
