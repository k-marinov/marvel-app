import UIKit
import Foundation

class MarvelCharacterDetailRouter: ViewControllerCreatable, Navigation {

    func showMarvelCharacter(
        with componentCreatable: ComponentCreatable,
        detail: MarvelCharacterDetailRepresentable,
        animated: Bool = true) {
        let controller = viewController(with: componentCreatable, detail: detail)
        navigationController()?.pushViewController(controller, animated: animated)
    }

    func openBrowser(with url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: { success in })
        }
    }

    private func viewController(
        with componentCreatable: ComponentCreatable,
        detail: MarvelCharacterDetailRepresentable) -> MarvelCharacterDetailViewController {
        return createViewController(with: MarvelCharacterDetailViewModel(with: componentCreatable, detail: detail),
            viewControllerType: MarvelCharacterDetailViewController.self)
            as! MarvelCharacterDetailViewController
    }

}
