import Foundation

extension ProcessInfo {

    static func isProductionEnabled() -> Bool {
        return !self.processInfo.arguments.contains("TEST_MODE_ENABLED")
    }

}
