import XCTest

@testable import MarvelApp

class MarvelCharactersViewModelTests: XCTestCase {

    let creator: MockComponentCreator = MockComponentCreator.buildAllMocks()
    var viewModel: MarvelCharactersViewModel!

    override func setUp() {
        super.setUp()
        viewModel = MarvelCharactersViewModel(with: creator)
    }

    func testOnSelectedRow_whenTableViewDidSelectRowTapped_showsCharacterDetail() {
        let indexPath = IndexPath(item: 1, section: 0)
        let viewModel = MarvelCharactersViewModel(with: creator)
        viewModel.tableViewDataSource.appendOnce(contentsOf: MarvelCharacterMother.marvelCharactersResource().characters())
        viewModel.tableViewDelegate.tableView(UITableView(frame: CGRect.zero), didSelectRowAt: indexPath)
        XCTAssertEqual(creator.mockMarvelCharacterDetailRouter().isShowMarvelCharacterCalled, true)
    }

    func testLoadMarvelCharacters_whenSuccess_callsOnStartedOnMainQueue() {
        let delegate: MockMarvelCharactersViewModelDelegate = MockMarvelCharactersViewModelDelegate()
        viewModel.delegate = delegate

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
        let delegate: MockMarvelCharactersViewModelDelegate = MockMarvelCharactersViewModelDelegate()
        viewModel.delegate = delegate

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
        let delegate: MockMarvelCharactersViewModelDelegate = MockMarvelCharactersViewModelDelegate()
        viewModel.delegate = delegate

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
        viewModel.delegate = nil

        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersSuccessResponse()
        let expectation = XCTestExpectation(description: "")
        viewModel.loadAllMarvelCharacters(onCompleted: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(viewModel.tableViewDataSource.count(), 3)
    }

}
