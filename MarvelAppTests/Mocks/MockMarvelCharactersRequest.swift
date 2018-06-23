@testable import MarvelApp

class MockMarvelCharactersRequest: MarvelCharactersRequest {

    private var url: String

    init(url: String) {
        self.url = url
    }

    override func httpRequestUrl() -> String {
        return url
    }

}
