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

    private func marvelCharactersViewController(viewModel: ViewModel) -> MarvelCharactersViewController {
        return createViewController(
            with: viewModel,
            viewControllerType: MarvelCharactersViewController.self)
            as! MarvelCharactersViewController
    }

}
