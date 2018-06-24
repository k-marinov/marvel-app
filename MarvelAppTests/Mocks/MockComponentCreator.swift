import Foundation

@testable import MarvelApp

class MockComponentCreator: ComponentCreatable {

    var marvelCharacterService: MarvelCharacterService!
    var marvelCharacterDetailRouter: MarvelCharacterDetailRouter!

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

    func mockMarvelCharacterDetailRouter() -> MockMarvelCharacterDetailRouter {
        return marvelCharacterDetailRouter as! MockMarvelCharacterDetailRouter
    }

    func create(with componentCreatable: ComponentCreatable) -> MarvelCharacterService {
        return marvelCharacterService
    }

    func create() -> MarvelCharacterDetailRouter {
        return marvelCharacterDetailRouter
    }

    class func buildAllMocks() -> MockComponentCreator {
        let creator: MockComponentCreator = MockComponentCreator()
        creator.marvelCharacterService = MockMarvelCharacterService(with: creator)
        creator.marvelCharacterDetailRouter = MockMarvelCharacterDetailRouter()
        return creator
    }

}
