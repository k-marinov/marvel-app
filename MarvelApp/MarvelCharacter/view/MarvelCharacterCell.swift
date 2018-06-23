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
        loadContent(with: tableViewItem)
    }

    private func loadContent(with tableViewItem: TableViewItem) {
        let character: MarvelCharacterResource = tableViewItem as! MarvelCharacterResource
        setName(of: character)
        loadImage(of: character)
    }

    private func setName(of character: MarvelCharacterResource) {
        nameLabel.text = character.name
    }

    private func loadImage(of character: MarvelCharacterResource) {
        ImageLoader.loadImage(url: character.imageUrl(), onSuccess: { image in
            self.photoView.image = image
        }, onError: {
            self.photoView.image = nil
        })
    }

    private func resetContent() {
        nameLabel.text = nil
        photoView.image = nil
    }

}
