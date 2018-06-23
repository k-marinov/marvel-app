import XCTest

@testable import MarvelApp

class MarvelAppTests: XCTestCase {

    func testSetup_whenSetupIsCalled_returnsUINavigationControllerAsRootViewController() {
        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersSuccessResponse()
        let window: UIWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 640))
        let app: MarvelApp = MarvelApp(with: MockComponentCreator.buildAllMocks())
        let newWindow = app.setUp(with: window)

        XCTAssertTrue(newWindow.rootViewController is UINavigationController)
    }

    func testSetup_whenSetupIsCalled_returnsMarvelCharactersViewControllerAsFirstChildOfRootViewController() {
        MockURLProtocol.requestHandler = MockURLProtocolMother.findAllMarvelCharactersSuccessResponse()
        let window: UIWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 640))
        let app: MarvelApp = MarvelApp(with: MockComponentCreator.buildAllMocks())
        let newWindow = app.setUp(with: window)
        XCTAssertTrue(newWindow.rootViewController!.childViewControllers.first is MarvelCharactersViewController)
    }

}
