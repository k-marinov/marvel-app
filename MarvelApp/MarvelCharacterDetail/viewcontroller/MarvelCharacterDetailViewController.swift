import UIKit

class MarvelCharacterDetailViewController: UIViewController, ModelableViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var visitWebsiteButton: UIButton!

    private(set) lazy var marvelCharacterDetailViewModel: MarvelCharacterDetailViewModel = {
        return self.viewModel as! MarvelCharacterDetailViewModel
    }()
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        loadContent()
    }

    private func setUp() {
        setUpImageView()
        setUpVisitWebsiteButtonVisibilityState()
    }

    private func setUpImageView() {
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.masksToBounds = true
    }

    private func setUpVisitWebsiteButtonVisibilityState() {
        visitWebsiteButton.isHidden = marvelCharacterDetailViewModel.isVisitWebsiteButtonHidden()
    }

    @IBAction func onButtonTapped(_ sender: UIButton) {
        marvelCharacterDetailViewModel.visitWebsite()
    }

    private func loadContent() {
        setName(of: marvelCharacterDetailViewModel.detail)
        setUpNavigationBarTitle(of: marvelCharacterDetailViewModel.detail)
        setDescription(of: marvelCharacterDetailViewModel.detail)
        loadImage(of: marvelCharacterDetailViewModel.detail)
    }

    private func setName(of character: MarvelCharacterDetailRepresentable) {
        nameLabel.text = character.name
    }

    private func setDescription(of character: MarvelCharacterDetailRepresentable) {
        descriptionLabel.text = character.descriptionWithFallback()
    }

    private func setUpNavigationBarTitle(of character: MarvelCharacterDetailRepresentable) {
        navigationItem.title = character.name
    }

    private func loadImage(of character: MarvelCharacterDetailRepresentable) {
        ImageLoader.loadImage(url: character.imageUrl(), onSuccess: { [weak self] image in
            self?.imageView.image = image
            }, onError: { [weak self] in
                self?.imageView.image = nil
        })
    }

}
