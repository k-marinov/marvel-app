class MarvelCharacterDetailViewModel: ViewModel {

    private(set) var detail: MarvelCharacterDetailRepresentable
    private var marvelCharacterDetailRouter: MarvelCharacterDetailRouter

    required init(with componentCreatable: ComponentCreatable, detail: MarvelCharacterDetailRepresentable) {
        marvelCharacterDetailRouter = componentCreatable.create()
        self.detail = detail
    }

    func isVisitWebsiteButtonHidden() -> Bool {
        return detail.detailWebsiteUrl() == nil
    }

    func visitWebsite() {
        marvelCharacterDetailRouter.openBrowser(with: detail.detailWebsiteUrl()!)
    }

}
