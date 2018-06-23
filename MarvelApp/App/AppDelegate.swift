import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let marvelApp: MarvelApp = MarvelApp(with: ComponentCreator())
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if ProcessInfo.isProductionEnabled() {
            _ = marvelApp.setUp(with: window!)
        }
        return true
    }

}


