import XCTest

@testable import MarvelApp

class MarvelCharactersViewModelTests: XCTestCase {

    let creator: MockComponentCreator = MockComponentCreator.buildAllMocks()
    var viewModel: MarvelCharactersViewModel!

    override func setUp() {
        super.setUp()
        viewModel = MarvelCharactersViewModel(with: creator)
    }

    func testLoadMarvelCharacters_whenSuccess_callOnStartedOnMainQueue() {
        var isCalled: Bool = false
        var isMainThread: Bool = false

        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersSuccessResponse()
        let expectation = XCTestExpectation(description: "")
        viewModel.loadAllMarvelCharacters(with: MarvelCharactersRequest(), onStarted: {
            isCalled = true
            isMainThread = Thread.isMainThread
            expectation.fulfill()
        }, onCompleted: {
        }, onError: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(isCalled, true)
        XCTAssertEqual(isMainThread, true)
    }

    func testLoadMarvelCharacters_whenSuccess_callOnCompletedOnMainQueue() {
        var isCalled: Bool = false
        var isMainThread: Bool = false

        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersSuccessResponse()
        let expectation = XCTestExpectation(description: "")
        viewModel.loadAllMarvelCharacters(with: MarvelCharactersRequest(), onStarted: {
        }, onCompleted: {
            isCalled = true
            isMainThread = Thread.isMainThread
            expectation.fulfill()
        }, onError: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(isCalled, true)
        XCTAssertEqual(isMainThread, true)
    }

    func testLoadMarvelCharacters_whenFails_callOnErrordOnMainQueue() {
        var isCalled: Bool = false
        var isMainThread: Bool = false

        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersFailureResponse()
        let expectation = XCTestExpectation(description: "")
        viewModel.loadAllMarvelCharacters(with: MarvelCharactersRequest(), onStarted: {
        }, onCompleted: {
            expectation.fulfill()
        }, onError: {
            isCalled = true
            isMainThread = Thread.isMainThread
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(isCalled, true)
        XCTAssertEqual(isMainThread, true)
    }

}