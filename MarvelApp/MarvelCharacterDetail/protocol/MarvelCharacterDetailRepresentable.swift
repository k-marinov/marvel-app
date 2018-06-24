import Foundation

protocol MarvelCharacterDetailRepresentable {

    var name: String { get }

    func imageUrl() -> URL?

    func descriptionWithFallback() -> String

    func detailWebsiteUrl() -> URL?

}
