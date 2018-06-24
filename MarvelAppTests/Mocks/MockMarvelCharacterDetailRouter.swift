import Foundation

@testable import MarvelApp

class MockMarvelCharacterDetailRouter: MarvelCharacterDetailRouter {

    var isShowMarvelCharacterCalled: Bool = false
    var isOpenBrowserCalled: Bool = false

    override func showMarvelCharacter(
        with componentCreatable: ComponentCreatable,
        detail: MarvelCharacterDetailRepresentable, animated: Bool) {
        isShowMarvelCharacterCalled = true
    }

    override func openBrowser(with url: URL) {
        isOpenBrowserCalled = true
    }

}
