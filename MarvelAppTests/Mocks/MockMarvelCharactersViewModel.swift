import Foundation

@testable import MarvelApp

class MockMarvelCharactersViewModel: MarvelCharactersViewModel {

    var selectedIndexPath: IndexPath?
    var isLoadAllMarvelCharactersCalled = false

    override func onSelected(indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }

    override func loadAllMarvelCharacters(
        onStarted: @escaping () -> Void,
        onCompleted: @escaping () -> Void,
        onError: @escaping () -> Void) {
        isLoadAllMarvelCharactersCalled = true
    }

}
