import XCTest

@testable import MarvelApp

class MarvelCharactersViewModelTests: XCTestCase {

    var creator: MockComponentCreator!
    var viewModel: MarvelCharactersViewModel!
    var delegate: MockMarvelCharactersViewModelDelegate!

    func beforeEach() {
        creator = MockComponentCreator.buildAllMocks()
        viewModel = MarvelCharactersViewModel(with: creator)
        delegate = MockMarvelCharactersViewModelDelegate()
        viewModel.delegate = delegate
    }

    func testOnSelectedRow_whenTableViewDidSelectRowTapped_showsCharacterDetail() {
        let indexPath = IndexPath(item: 1, section: 0)
        beforeEach()
        viewModel.tableViewDataSource.appendOnce(contentsOf: MarvelCharacterMother.marvelCharactersResource().characters())
        viewModel.tableViewDelegate.tableView(UITableView(frame: CGRect.zero), didSelectRowAt: indexPath)
        XCTAssertEqual(creator.mockMarvelCharacterDetailRouter().isShowMarvelCharacterCalled, true)
    }

    func testLoadMarvelCharacters_whenSuccess_callsOnStartedOnMainQueue() {
        beforeEach()

        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersSuccessResponse()
        let expectation = XCTestExpectation(description: "")
        viewModel.loadAllMarvelCharacters(onCompleted: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(delegate.isOnLoadContentStartedCalled, true)
        XCTAssertEqual(delegate.isOnLoadContentStartedOnMainQueue, true)
    }

    func testLoadMarvelCharacters_whenSuccess_callsOnCompletedOnMainQueue() {
        beforeEach()

        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersSuccessResponse()
        let expectation = XCTestExpectation(description: "")
        viewModel.loadAllMarvelCharacters(onCompleted: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(delegate.isOnLoadContentCompletedCalled, true)
        XCTAssertEqual(delegate.isOnLoadContentCompletedOnMainQueue, true)
    }

    func testLoadMarvelCharacters_whenFails_callsOnErrordOnMainQueue() {
        beforeEach()

        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersFailureResponse()
        let expectation = XCTestExpectation(description: "")
        viewModel.loadAllMarvelCharacters(onCompleted: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(delegate.isOnLoadContentErrorCalled, true)
        XCTAssertEqual(delegate.isOnLoadContentErrorOnMainQueue, true)
    }

    func testLoadMarvelCharacters_whenSuccess_appendsToDataSource() {
        beforeEach()

        let expectation = XCTestExpectation(description: "")
        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersSuccessResponse()
        viewModel.loadAllMarvelCharacters(onCompleted: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(viewModel.tableViewDataSource.count(), 3)
    }

}
