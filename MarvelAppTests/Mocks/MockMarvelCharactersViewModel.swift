import Foundation

@testable import MarvelApp

class MockMarvelCharactersViewModel: MarvelCharactersViewModel {

    var isLoadAllMarvelCharactersCalled = false

    override func loadAllMarvelCharacters(
        onStarted: @escaping () -> Void,
        onCompleted: @escaping () -> Void,
        onError: @escaping () -> Void) {
        isLoadAllMarvelCharactersCalled = true
    }

}
