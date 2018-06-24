import XCTest

@testable import MarvelApp

class MarvelCharacterDetailViewControllerTests: XCTestCase, ViewControllerCreatable {

    var creator = MockComponentCreator.buildAllMocks()

    func testViewDidLoad_whenLoaded_setsUpImageViewCornerRadius() {
        let character = MarvelCharacterMother.marvelCharactersResource().characters().first!
        let viewModel = MarvelCharacterDetailViewModel(with: creator, detail: character)
        let viewController = detailViewController(viewModel: viewModel)
        _ = viewController.view
        let expectedSize = viewController.imageView.frame.size.width / 2
        XCTAssertEqual(viewController.imageView.layer.cornerRadius, expectedSize)
    }

    func testViewDidLoad_whenLoaded_loadsContent() {
        let character = MarvelCharacterMother.marvelCharactersResource().characters().first!
        let viewModel = MarvelCharacterDetailViewModel(with: creator, detail: character)
        let viewController = detailViewController(viewModel: viewModel)
        _ = viewController.view
        XCTAssertEqual(viewController.nameLabel.text, character.name)
        XCTAssertEqual(viewController.descriptionLabel.text, character.descriptionWithFallback())
        XCTAssertEqual(viewController.navigationItem.title, character.name)
    }

    func testVisitWebsiteButton_whenDoesNotHaveDetailUrl_hidesVisitWebsiteButton() {
        let character = MarvelCharacterMother.marvelCharactersResource().characters().last!
        let viewModel = MarvelCharacterDetailViewModel(with: creator, detail: character)
        let viewController = detailViewController(viewModel: viewModel)
        _ = viewController.view
        XCTAssertTrue(viewController.visitWebsiteButton.isHidden)
    }

    func testVisitWebsiteButton_whenHasDetailUrl_showsVisitWebsiteButton() {
        let character = MarvelCharacterMother.marvelCharactersResource().characters().first!
        let viewModel = MarvelCharacterDetailViewModel(with: creator, detail: character)
        let viewController = detailViewController(viewModel: viewModel)
        _ = viewController.view
        XCTAssertFalse(viewController.visitWebsiteButton.isHidden)
    }

    func testVisitWebsiteButton_whenTapped_OpensBrowser() {
        let character = MarvelCharacterMother.marvelCharactersResource().characters().first!
        let viewModel = MarvelCharacterDetailViewModel(with: creator, detail: character)
        let viewController = detailViewController(viewModel: viewModel)
        _ = viewController.view
        viewController.visitWebsiteButton.sendActions(for: UIControlEvents.touchUpInside)
        XCTAssertTrue(creator.mockMarvelCharacterDetailRouter().isOpenBrowserCalled)
    }

    private func detailViewController(viewModel: ViewModel) -> MarvelCharacterDetailViewController {
        return createViewController(
            with: viewModel,
            viewControllerType: MarvelCharacterDetailViewController.self)
            as! MarvelCharacterDetailViewController
    }

}
