@testable import MarvelApp

class MockMarvelCharacterDetailRouter: MarvelCharacterDetailRouter {

    var isShowMarvelCharacterCalled: Bool = false

    override func showMarvelCharacter(with detail: MarvelCharacterDetailRepresentable, animated: Bool) {
        isShowMarvelCharacterCalled = true
    }

}
