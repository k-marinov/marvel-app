class MarvelCharacterDetailViewModel: ViewModel {

    var detail: MarvelCharacterDetailRepresentable

    required init(with detail: MarvelCharacterDetailRepresentable) {
       self.detail = detail
    }

}
