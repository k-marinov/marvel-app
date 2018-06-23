import Foundation
import UIKit

class ImageLoader {

    private static var cache: [URL: UIImage] = [URL: UIImage]()
    private static let cacheLimit: Int = 50

    class func loadImage(
        url: URL?,
        onSuccess: @escaping (UIImage)->(),
        onError: @escaping ()->(),
        urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default) {

        guard let url = url else {
            onError()
            return
        }

        if let cachedImage = cache[url] {
            onSuccess(cachedImage)
        } else {
            downloadImage(url: url, onSuccess: { image in
                onSuccess(image)
            }, onError: {
                onError()
            }, urlSessionConfiguration: urlSessionConfiguration)
        }
    }

    class func clearCache() {
        cache.removeAll()
    }

    class func cacheSize() -> Int {
        return cache.count
    }

    private class func downloadImage(
        url: URL,
        onSuccess: @escaping (UIImage)->(),
        onError: @escaping ()->(),
        urlSessionConfiguration: URLSessionConfiguration) {
        let httpClient = HttpClient(urlSessionConfiguration: urlSessionConfiguration)
        httpClient.request(urlRequest: asUrlRequest(url: url)) { httpResponse in
            saveInCacheIfValidResponse(url: url, httpResponse: httpResponse, onSuccess: { image in
                onSuccess(image)
            }, onError: {
                onError()
            })
        }
    }

    private class func saveInCacheIfValidResponse(
        url: URL,
        httpResponse: HttpResponse,
        onSuccess: @escaping (UIImage)->(),
        onError: @escaping ()->()) {
        if isValidResponse(httpResponse: httpResponse) {
            saveInCacheAndReturnImageNotNil(url: url, httpResponse: httpResponse, onSuccess: { image in
                onSuccess(image)
            }, onError: {
                onError()
            })
        } else {
            onMainQueue {
                onError()
            }
        }
    }

    private class func saveInCacheAndReturnImageNotNil(
        url: URL,
        httpResponse: HttpResponse,
        onSuccess: @escaping (UIImage)->(),
        onError: @escaping ()->()) {
        onMainQueue {
            if let image = UIImage(data: httpResponse.data!) {
                addToCacheIfNotReachedLimit(url: url, image: image)
                onSuccess(image)
            } else {
                onError()
            }
        }
    }

    private class func addToCacheIfNotReachedLimit(url: URL, image: UIImage) {
        if cache.count < cacheLimit {
            cache[url] = image
        }
    }

    private class func isValidResponse(httpResponse: HttpResponse) -> Bool {
        return httpResponse.error == nil && httpResponse.data != nil && !httpResponse.data!.isEmpty
    }

    private class func asUrlRequest(url: URL) -> URLRequest {
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 33.0
        return request
    }

}
