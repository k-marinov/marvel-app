import UIKit

class MarvelCharacterDetailRouter: ViewControllerCreatable, Navigation {

    func showMarvelCharacter(with detail: MarvelCharacterDetailRepresentable, animated: Bool = true) {
        navigationController()?.pushViewController(viewController(with: detail), animated: animated)
    }

    private func viewController(with detail: MarvelCharacterDetailRepresentable) -> MarvelCharacterDetailViewController {
        return createViewController(with: MarvelCharacterDetailViewModel(with: detail),
            viewControllerType: MarvelCharacterDetailViewController.self)
            as! MarvelCharacterDetailViewController
    }

}
