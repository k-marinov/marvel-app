//import Foundation
import XCTest

@testable import MarvelApp

class ImageLoaderTests: XCTestCase {

    let creator: MockComponentCreator = MockComponentCreator.buildAllMocks()
    var viewModel: MarvelCharactersViewModel!
    let configuration = URLSessionConfiguration.ephemeral
    let successUrl: URL = URL(string: "http://marvel.image/1")!

    override func setUp() {
        super.setUp()
        configuration.protocolClasses = [MockURLProtocol.self]
    }

    func testLoadImage_whenUrlIsNil_callOnErrorOnMainQueue() {
        var hasError: Bool = false
        var isMainThread: Bool = false

        MockURLProtocol.requestHandler = MockURLProtocolMother.successImageResponse()
        let expectation = XCTestExpectation(description: "")

        ImageLoader.clearCache()
        ImageLoader.loadImage(url: nil, onSuccess: { image in
            expectation.fulfill()
        }, onError: {
            hasError = true
            isMainThread = Thread.isMainThread
            expectation.fulfill()
        }, urlSessionConfiguration: configuration)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(ImageLoader.cacheSize(), 0)
        XCTAssertEqual(hasError, true)
        XCTAssertEqual(isMainThread, true)
    }

    func testLoadImage_whenHasValidUrl_callOnSuccessOnMainQueue() {
        var image: UIImage?
        var isMainThread: Bool = false

        MockURLProtocol.requestHandler = MockURLProtocolMother.successImageResponse()
        let expectation = XCTestExpectation(description: "")

        ImageLoader.clearCache()
        ImageLoader.loadImage(url: successUrl, onSuccess: { newImage in
            image = newImage
            isMainThread = Thread.isMainThread
            expectation.fulfill()
        }, onError: {
            expectation.fulfill()
        }, urlSessionConfiguration: configuration)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(ImageLoader.cacheSize(), 1)
        XCTAssertEqual(image?.size, ImageMother().image1x1().size)
        XCTAssertEqual(UIImagePNGRepresentation(image!)?.hashValue, ImageMother().image1x1Data().hashValue)
        XCTAssertEqual(isMainThread, true)
    }

    func testLoadImage_whenDataIsNil_callOnErrorOnMainQueue() {
        var hasError: Bool = false
        var isMainThread: Bool = false

        MockURLProtocol.requestHandler = MockURLProtocolMother.dataNilImageResponse()
        let expectation = XCTestExpectation(description: "")

        ImageLoader.clearCache()
        ImageLoader.loadImage(url: successUrl, onSuccess: { newImage in
            expectation.fulfill()
        }, onError: {
            hasError = true
            isMainThread = Thread.isMainThread
            expectation.fulfill()
        }, urlSessionConfiguration: configuration)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(ImageLoader.cacheSize(), 0)
        XCTAssertEqual(hasError, true)
        XCTAssertEqual(isMainThread, true)
    }

    func testLoadImage_whenHasFailure_callOnErrorOnMainQueue() {
        var hasError: Bool = false
        var isMainThread: Bool = false

        MockURLProtocol.requestHandler = MockURLProtocolMother.failureImageResponse()
        let expectation = XCTestExpectation(description: "")

        ImageLoader.clearCache()
        ImageLoader.loadImage(url: successUrl, onSuccess: { newImage in
            expectation.fulfill()
        }, onError: {
            hasError = true
            isMainThread = Thread.isMainThread
            expectation.fulfill()
        }, urlSessionConfiguration: configuration)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(ImageLoader.cacheSize(), 0)
        XCTAssertEqual(hasError, true)
        XCTAssertEqual(isMainThread, true)
    }

    func testLoadImage_whenInvalidImageData_callOnErrorOnMainQueue() {
        var hasError: Bool = false
        var isMainThread: Bool = false

        ImageLoader.clearCache()
        MockURLProtocol.requestHandler = MockURLProtocolMother.invalidImageDataResponse()
        let expectation = XCTestExpectation(description: "")

        ImageLoader.loadImage(url: successUrl, onSuccess: { newImage in
            expectation.fulfill()
        }, onError: {
            hasError = true
            isMainThread = Thread.isMainThread
            expectation.fulfill()
        }, urlSessionConfiguration: configuration)
        wait(for: [expectation], timeout: Constants.timeout)

        XCTAssertEqual(ImageLoader.cacheSize(), 0)
        XCTAssertEqual(hasError, true)
        XCTAssertEqual(isMainThread, true)
    }

}
