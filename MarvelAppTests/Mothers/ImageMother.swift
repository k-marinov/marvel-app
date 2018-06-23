import UIKit

class ImageMother {

    func image1x1() -> UIImage {
        return UIImage(named: "1x1", in: Bundle(for: type(of: self)), compatibleWith: nil)!
    }

    func image1x1Data() -> Data {
        return UIImagePNGRepresentation(ImageMother().image1x1())!
    }

}
