import Foundation

protocol ViewModel {

    func onMainQueue(_ closure: @escaping () -> Void)

}


extension ViewModel {

    func onMainQueue(_ closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }

}
