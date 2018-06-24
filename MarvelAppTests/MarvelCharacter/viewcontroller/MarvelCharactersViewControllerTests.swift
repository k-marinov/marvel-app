import XCTest

@testable import MarvelApp

class MarvelCharactersViewControllerTests: XCTestCase, ViewControllerCreatable {

    let creator: MockComponentCreator = MockComponentCreator.buildAllMocks()

    func testViewDidLoad_whenLoaded_setsUpTableView() {
        let viewModel = MockMarvelCharactersViewModel(with: creator)
        let viewController = marvelCharactersViewController(viewModel: viewModel)
        _ = viewController.view
        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertNotNil(viewController.tableView.delegate)
    }

    func testViewDidLoad_whenLoaded_loadAllMarvelCharacters() {
        let viewModel = MockMarvelCharactersViewModel(with: creator)
        let viewController = marvelCharactersViewController(viewModel: viewModel)
         _ = viewController.view
        XCTAssertTrue(viewModel.isLoadAllMarvelCharactersCalled)
    }

    func testViewDidLoad_whenLoaded_setsNavigationBarTitleToCharacters() {
        let viewModel = MockMarvelCharactersViewModel(with: creator)
        let viewController = marvelCharactersViewController(viewModel: viewModel)
        _ = viewController.view
        XCTAssertEqual(viewController.navigationItem.title, "Characters")
    }

    func testOnLoadContentStarted_setsActivityIndicatorVisible() {
        let viewModel = MockMarvelCharactersViewModel(with: creator)
        let viewController = marvelCharactersViewController(viewModel: viewModel)
        _ = viewController.view
        viewController.onLoadContentStarted()
        XCTAssertEqual(viewController.activityIndicatorView.isAnimating, true)
    }

    func testOnLoadContentCompleted_setsActivityIndicatorHidden() {
        let viewModel = MockMarvelCharactersViewModel(with: creator)
        let viewController = marvelCharactersViewController(viewModel: viewModel)
        _ = viewController.view
        viewController.onLoadContentStarted()
        XCTAssertEqual(viewController.activityIndicatorView.isAnimating, true)

        viewController.onLoadContentCompleted()
        XCTAssertEqual(viewController.activityIndicatorView.isAnimating, false)
        XCTAssertEqual(viewController.activityIndicatorView.isHidden, true)
    }

    func testOnLoadContentError_setsActivityIndicatorHidden() {
        let viewModel = MockMarvelCharactersViewModel(with: creator)
        let viewController = marvelCharactersViewController(viewModel: viewModel)
        _ = viewController.view
        viewController.onLoadContentStarted()
        XCTAssertEqual(viewController.activityIndicatorView.isAnimating, true)

        viewController.onLoadContentError()
        XCTAssertEqual(viewController.activityIndicatorView.isAnimating, false)
        XCTAssertEqual(viewController.activityIndicatorView.isHidden, true)
    }

    func testOnLoadContentCompleted_reloadsTableView() {
        let mockTableView = MockTableView()
        let viewModel = MockMarvelCharactersViewModel(with: creator)
        let viewController = marvelCharactersViewController(viewModel: viewModel)
        _ = viewController.view
        viewController.tableView = mockTableView
        viewController.onLoadContentCompleted()
        XCTAssertEqual(mockTableView.isReloadDataCalled, true)
    }

    private func marvelCharactersViewController(viewModel: ViewModel) -> MarvelCharactersViewController {
        return createViewController(
            with: viewModel,
            viewControllerType: MarvelCharactersViewController.self)
            as! MarvelCharactersViewController
    }

}
