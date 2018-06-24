import Foundation

class MarvelCharactersViewModel: ViewModel, RowSelectable {

    private var marvelCharactersService: MarvelCharacterService
    private(set) var tableViewDataSource = TableViewDataSource<MarvelCharacterResource, MarvelCharacterCell>()
    private(set) var tableViewDelegate: TableViewDelegate!
    private(set) var marvelCharactersRouter: MarvelCharactersRouter
    private var componentCreatable: ComponentCreatable
    weak var delegate: MarvelCharactersViewModelDelegate?

    required init(with componentCreatable: ComponentCreatable) {
        self.componentCreatable = componentCreatable
        marvelCharactersService = componentCreatable.create(with: componentCreatable)
        marvelCharactersRouter = componentCreatable.create(with: componentCreatable)
        tableViewDelegate = TableViewDelegate(rowSelectable: self)
    }

    func loadAllMarvelCharacters(onCompleted: (()-> Void)? = nil) {
        delegate?.onLoadContentStarted()
        marvelCharactersService.findAllMarvelCharacters(
            with: MarvelCharactersRequest(),
            onCompleted: { [weak self] newMarvelCharacters in
                self?.onLoadCompleted(with: newMarvelCharacters) {
                    onCompleted?()
                }
            }, onError: { [weak self] apiError in
                self?.onLoadCompleted(with : apiError) {
                    onCompleted?()
                }

        })
    }

    private func onLoadCompleted(with newMarvelCharacters: [MarvelCharacterResource], onCompleted: (()-> Void)? = nil) {
        onMainQueue { [weak self] in
            self?.tableViewDataSource.appendOnce(contentsOf: newMarvelCharacters)
            self?.delegate?.onLoadContentCompleted()
            onCompleted?()
        }
    }

    private func onLoadCompleted(with error: ApiError, onCompleted: (()-> Void)? = nil) {
        onMainQueue { [weak self] in
            self?.delegate?.onLoadContentError()
            self?.marvelCharactersRouter.showErrorAlert(with: error, onRefreshButtonTapped: { [weak self] in
                self?.loadAllMarvelCharacters()
            })
            onCompleted?()
        }
    }

    func onSelected(indexPath: IndexPath) {
        let detail = findCharacterDetail(indexPath: indexPath)
        marvelCharactersRouter.showMarvelCharacter(with: componentCreatable, detail: detail)
    }

    private func findCharacterDetail(indexPath: IndexPath) -> MarvelCharacterDetailRepresentable {
        return tableViewDataSource.findItem(at: indexPath) as! MarvelCharacterDetailRepresentable
    }

}
