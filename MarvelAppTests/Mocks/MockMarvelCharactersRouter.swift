@testable import MarvelApp

class MockMarvelCharactersRouter: MarvelCharactersRouter {

    var isShowErrorAlertCalled: Bool = false

    override func showErrorAlert(with error: ApiError, onRefreshButtonTapped: @escaping () -> Void) {
        isShowErrorAlertCalled = true
    }

}
