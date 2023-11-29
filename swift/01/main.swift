import Foundation
import MyCommon

func main() {
    guard let path = Bundle.module.url(forResource: "input", withExtension: "txt") else {
        fatalError("Could not find url for input")
    }

    let commons = AOCCommons()
    guard let input = commons.readInput(path) else {
        fatalError("Failed to read input file")
    }
    print(input)
}

main()