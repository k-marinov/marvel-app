import Foundation

@testable import MarvelApp

class MockMarvelCharactersViewModelDelegate: MarvelCharactersViewModelDelegate {

    var isOnLoadContentStartedCalled: Bool = false
    var isOnLoadContentCompletedCalled: Bool = false
    var isOnLoadContentErrorCalled: Bool = false

    var isOnLoadContentStartedOnMainQueue: Bool = false
    var isOnLoadContentCompletedOnMainQueue: Bool = false
    var isOnLoadContentErrorOnMainQueue: Bool = false

    func onLoadContentStarted() {
        isOnLoadContentStartedCalled = true
        isOnLoadContentStartedOnMainQueue = Thread.isMainThread
    }

    func onLoadContentCompleted() {
        isOnLoadContentCompletedCalled = true
        isOnLoadContentCompletedOnMainQueue = Thread.isMainThread
    }

    func onLoadContentError() {
        isOnLoadContentErrorCalled = true
        isOnLoadContentErrorOnMainQueue = Thread.isMainThread
    }

}
