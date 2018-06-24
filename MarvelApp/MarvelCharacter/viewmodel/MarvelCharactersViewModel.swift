import Foundation

class MarvelCharactersViewModel: ViewModel, RowSelectable {

    private var marvelCharactersService: MarvelCharacterService
    private(set) var dataSource = TableViewDataSource<MarvelCharacterResource, MarvelCharacterCell>()
    private(set) var delegate: TableViewDelegate!
    private(set) var marvelCharacterDetailRouter: MarvelCharacterDetailRouter

    required init(with componentCreatable: ComponentCreatable) {
        marvelCharactersService = componentCreatable.create(with: componentCreatable)
        marvelCharacterDetailRouter = componentCreatable.create()
        delegate = TableViewDelegate(rowSelectable: self)
    }

    func loadAllMarvelCharacters(
        onStarted: @escaping () -> Void,
        onCompleted: @escaping () -> Void,
        onError: @escaping () -> Void) {

        onStarted()
        marvelCharactersService.findAllMarvelCharacters(
            with: MarvelCharactersRequest(),
            onCompleted: { [weak self] newMarvelCharacters in
                onMainQueue {
                    self?.dataSource.appendOnce(contentsOf: newMarvelCharacters)
                    onCompleted()
                }
            }, onError: { apiError in
                onMainQueue {
                    onError()
                }
        })
    }

    func onSelected(indexPath: IndexPath) {
        marvelCharacterDetailRouter.showMarvelCharacter(with: findCharacterDetail(indexPath: indexPath))
    }

    private func findCharacterDetail(indexPath: IndexPath) -> MarvelCharacterDetailRepresentable {
        return dataSource.findItem(at: indexPath) as! MarvelCharacterDetailRepresentable
    }

}
