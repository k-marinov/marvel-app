import UIKit

class MarvelCharactersViewController: UIViewController, ModelableViewController {

    @IBOutlet weak var tableView: UITableView!
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
    }

    private func loadContent() {
        marvelCharactersViewModel.loadAllMarvelCharacters(with: MarvelCharactersRequest(), onStarted: {

        }, onCompleted: {
            self.tableView.reloadData()
        }) {

        }
    }

    private func setUpNavigationBarTitle() {
        navigationItem.title = "Characters"
    }

}
