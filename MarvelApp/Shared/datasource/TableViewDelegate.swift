import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate {

    private weak var rowSelectable: RowSelectable?

    required init(rowSelectable: RowSelectable) {
        self.rowSelectable = rowSelectable
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelectable?.onSelected(indexPath: indexPath)
    }

}
