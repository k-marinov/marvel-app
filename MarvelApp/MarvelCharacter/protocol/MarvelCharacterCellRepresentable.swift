import Foundation

protocol MarvelCharacterCellRepresentable: TableViewItem {

    var name: String { get }

    func imageUrl() -> URL?

}
