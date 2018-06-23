import UIKit

class MarvelCharacterCell: UITableViewCell, TableViewCell {

    static var identifier: String = "\(MarvelCharacterCell.self)"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configureCell(with tableViewItem: TableViewItem) {
        resetContent()

        let character = tableViewItem as! MarvelCharacterResource
        nameLabel.text = character.name
        ImageLoader.loadImage(url: character.imageUrl()) { [weak self] image in
            self?.photoView.image = image
        }
    }

    private func resetContent() {
        nameLabel.text = nil
    }

}
