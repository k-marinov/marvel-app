import Foundation

class HttpClient {

    func request(urlRequest: URLRequest, onCompleted: @escaping (_ httpResponse: HttpResponse) -> Void) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
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
