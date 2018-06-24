import UIKit

class MarvelCharactersViewController: UIViewController, MarvelCharactersViewModelDelegate, ModelableViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    private(set) lazy var marvelCharactersViewModel: MarvelCharactersViewModel = {
        return self.viewModel as! MarvelCharactersViewModel
    }()
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpViewModelDelegate()
        marvelCharactersViewModel.loadAllMarvelCharacters()
    }

    private func setUp() {
        setUpTableView()
        setUpNavigationBarTitle()
    }

    private func setUpViewModelDelegate() {
        marvelCharactersViewModel.delegate = self
    }

    private func setUpTableView() {
        tableView.registerCellNib(with: MarvelCharacterCell.identifier)
        tableView.dataSource = marvelCharactersViewModel.tableViewDataSource
        tableView.delegate = marvelCharactersViewModel.tableViewDelegate
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    func onLoadContentStarted() {
        activityIndicatorView.startAnimating()
    }

    func onLoadContentCompleted() {
        activityIndicatorView.stopAnimating()
        tableView.reloadData()
    }

    func onLoadContentError() {
        activityIndicatorView.stopAnimating()
    }

    private func setUpNavigationBarTitle() {
        navigationItem.title = "Characters"
    }

}
