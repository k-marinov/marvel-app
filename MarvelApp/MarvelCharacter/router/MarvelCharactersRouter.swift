import UIKit

class MarvelCharactersRouter: ViewControllerCreatable, Navigation {

    private let marvelCharacterDetailRouter: MarvelCharacterDetailRouter
    private var componentCreatable: ComponentCreatable

    required init(with componentCreatable: ComponentCreatable) {
        self.componentCreatable = componentCreatable
        marvelCharacterDetailRouter = componentCreatable.create()
    }

    func viewController(with componentCreatable: ComponentCreatable) -> MarvelCharactersViewController {
        return createViewController(
            with: MarvelCharactersViewModel(with: componentCreatable),
            viewControllerType: MarvelCharactersViewController.self) as! MarvelCharactersViewController
    }

    func showMarvelCharacter(with componentCreatable: ComponentCreatable, detail: MarvelCharacterDetailRepresentable) {
        marvelCharacterDetailRouter.showMarvelCharacter(with: componentCreatable, detail: detail)
    }

    func showErrorAlert(with error: ApiError, onRefreshButtonTapped: @escaping () -> Void) {
        let alert = UIAlertController(
            title: "Error: \(error)",
            message: "Please try again",
            preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Refresh", style: UIAlertActionStyle.default, handler: { action in
            onRefreshButtonTapped()
        }))
        navigationController()?.present(alert, animated: true, completion: nil)
    }

}
