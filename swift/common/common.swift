import Foundation

public class AOCCommons {

    public init() {

    }

    public func readInput(_ path: URL) -> String? {
        guard let fileInput = try? String(contentsOf: path) else {
            return Optional.none
        }
        return fileInput
    }
}