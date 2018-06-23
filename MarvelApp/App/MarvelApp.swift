import UIKit

class MarvelApp {

    private let marvelAppRouter: MarvelAppRouter
    private let componentCreatable: ComponentCreatable

    required init(with componentCreatable: ComponentCreatable) {
        self.componentCreatable = componentCreatable
        marvelAppRouter = componentCreatable.create(with: componentCreatable)
    }

    func setUp(with window: UIWindow) -> UIWindow {
        return marvelAppRouter.setRootViewController(to: window, componentCreatable: componentCreatable)
    }

}
