import UIKit

class MarvelCharactersViewController: UIViewController, ModelableViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    private(set) lazy var marvelCharactersViewModel: MarvelCharactersViewModel = {
        return self.viewModel as! MarvelCharactersViewModel
    }()
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        loadContent()
    }

    private func setUp() {
        setUpTableView()
        setUpNavigationBarTitle()
    }

    private func setUpTableView() {
        tableView.registerCellNib(with: MarvelCharacterCell.identifier)
        tableView.dataSource = marvelCharactersViewModel.dataSource
        tableView.delegate = marvelCharactersViewModel.delegate
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    private func loadContent() {
        marvelCharactersViewModel.loadAllMarvelCharacters(onStarted: {[weak self] in
            self?.activityIndicatorView.startAnimating()
        }, onCompleted: { [weak self] in
            self?.activityIndicatorView.stopAnimating()
            self?.tableView.reloadData()
        }, onError: { [weak self] in
            self?.activityIndicatorView.stopAnimating()
        })
    }

    private func setUpNavigationBarTitle() {
        navigationItem.title = "Characters"
    }

}
