import Foundation

class HttpClient {

    private var urlSessionConfiguration: URLSessionConfiguration!

    init(urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default) {
        self.urlSessionConfiguration = urlSessionConfiguration
    }

    func request(urlRequest: URLRequest, onCompleted: @escaping (_ httpResponse: HttpResponse) -> Void) {
        let session = URLSession(configuration: urlSessionConfiguration)
        let task: URLSessionDataTask = session.dataTask(
            with: urlRequest,
            completionHandler: { data, response, error in
                let httpResponse: HttpResponse = HttpResponse(
                    response: response as? HTTPURLResponse,
                    data: data,
                    error: error)
                onCompleted(httpResponse)
        })
        task.resume()
    }

}
