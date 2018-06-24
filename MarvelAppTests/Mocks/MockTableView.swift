import UIKit
@testable import MarvelApp

class MockTableView: UITableView {

    var isReloadDataCalled: Bool = false

    override func reloadData() {
        isReloadDataCalled = true
    }

}
