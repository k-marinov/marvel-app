import Foundation
import UIKit

class ImageLoader {

    class func loadImage(url: String?, onCompleted: @escaping (UIImage)->()) {
        DispatchQueue(label: "ImageLoader", attributes: DispatchQueue.Attributes.concurrent).async {
            if let imageData = imageData(from: url) {
                DispatchQueue.main.async {
                    onCompleted(imageData)
                }
            }
        }
    }

    private class func imageData(from urlString: String?) -> UIImage? {
        if let urlString = urlString,
            let url = URL(string: urlString) {
            do {
                return UIImage(data: try Data(contentsOf: url))
            } catch { }
        }
        return nil
    }

}
