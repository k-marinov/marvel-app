import UIKit

class MarvelCharactersRouter: ViewControllerCreatable, Navigation {

    func viewController(with componentCreatable: ComponentCreatable) -> MarvelCharactersViewController {
        return createViewController(
            with: MarvelCharactersViewModel(with: componentCreatable),
            viewControllerType: MarvelCharactersViewController.self) as! MarvelCharactersViewController
    }

}
