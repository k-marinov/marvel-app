import Foundation

@testable import MarvelApp

class MockMarvelCharactersViewModel: MarvelCharactersViewModel {

    var isLoadAllMarvelCharactersCalled = false

    override func loadAllMarvelCharacters(onCompleted: (() -> Void)?) {
        isLoadAllMarvelCharactersCalled = true
    }

}
