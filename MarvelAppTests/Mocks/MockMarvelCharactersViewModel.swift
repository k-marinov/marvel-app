import Foundation

@testable import MarvelApp

class MockMarvelCharactersViewModel: MarvelCharactersViewModel {

    var selectedIndexPath: IndexPath?

    override func onSelected(indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }

}
