import Foundation

class MarvelCharactersViewModel: ViewModel, RowSelectable {

    private var marvelCharactersService: MarvelCharacterService
    private(set) var dataSource = TableViewDataSource<MarvelCharacterResource, MarvelCharacterCell>()
    private(set) var delegate: TableViewDelegate!

    required init(with componentCreatable: ComponentCreatable) {
        marvelCharactersService = componentCreatable.create(with: componentCreatable)
        delegate = TableViewDelegate(rowSelectable: self)
    }

    func loadAllMarvelCharacters(
        with request: MarvelCharactersRequest,
        onStarted: @escaping () -> Void,
        onCompleted: @escaping () -> Void,
        onError: @escaping () -> Void) {

        onStarted()
        marvelCharactersService.findAllMarvelCharacters(
            with: MarvelCharactersRequest(),
            onCompleted: { [weak self] newMarvelCharacters in
                self?.onMainQueue {
                    self?.dataSource.appendOnce(contentsOf: newMarvelCharacters)
                    onCompleted()
                }
        }, onError: { [weak self]  apiError in
            self?.onMainQueue {
                onError()
            }
        })
    }

    func onSelected(indexPath: IndexPath) {
        // TODO: navigate to details
    }

}
