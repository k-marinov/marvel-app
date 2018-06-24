import UIKit

class MarvelCharacterDetailViewController: UIViewController, ModelableViewController {

    private(set) lazy var marvelCharacterDetailViewModel: MarvelCharacterDetailViewModel = {
        return self.viewModel as! MarvelCharacterDetailViewModel
    }()
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
