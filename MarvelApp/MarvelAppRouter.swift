import UIKit

class MarvelAppRouter {

    private let marvelCharactersRouter: MarvelCharactersRouter

    required init(with componentCreatable: ComponentCreatable) {
        marvelCharactersRouter = componentCreatable.create()
    }

    func setRootViewController(to window: UIWindow, componentCreatable: ComponentCreatable) -> UIWindow {
        let viewController = marvelCharactersRouter.viewController(with: componentCreatable)
        window.rootViewController = rootNavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
        return window
    }

    private func rootNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.gray]
        controller.navigationBar.tintColor = UIColor.gray
        return controller
    }

}
