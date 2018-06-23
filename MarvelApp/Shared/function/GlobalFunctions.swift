import Foundation

func onMainQueue(_ closure: @escaping () -> Void) {
    DispatchQueue.main.async {
        closure()
    }
}
