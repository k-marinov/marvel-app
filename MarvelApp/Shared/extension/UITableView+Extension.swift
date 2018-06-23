import UIKit

extension UITableView {

    func registerCellNib(with identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }

}
