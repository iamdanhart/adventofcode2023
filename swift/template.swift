import Foundation
import MyCommon

func part1(lines: [String]) -> Int {
    var sum = 0

    

    return sum
}

func part2(lines: [String]) -> Int {
    var sum = 0

    
    return sum
}

func main() {
    guard let t1 = Bundle.module.url(forResource: "testinput", withExtension: "txt") else {
        fatalError("Could not find url for input")
    }
    guard let t2 = Bundle.module.url(forResource: "testinput2", withExtension: "txt") else {
        fatalError("Could not find url for input")
    }
    guard let path = Bundle.module.url(forResource: "input", withExtension: "txt") else {
        fatalError("Could not find url for input")
    }

    let commons = AOCCommons()

    guard let t1Input = commons.readInput(t1) else {
        fatalError("Failed to read input file")
    }
    guard let t2Input = commons.readInput(t2) else {
        fatalError("Failed to read input file")
    }
    guard let input = commons.readInput(path) else {
        fatalError("Failed to read input file")
    }

    let spotCheck1 = part1(lines: t1Input.components(separatedBy: "\n"))
    let part1Solution = part1(lines: input.components(separatedBy: "\n"))
    let spotCheck2 = part2(lines: t2Input.components(separatedBy: "\n"))
    let part2Solution = part2(lines: input.components(separatedBy: "\n"))

    print("The spot check to part 1 is \(spotCheck1)")
    print("The answer to part 1 is \(part1Solution)")
    print("The spot check to part 2 is \(spotCheck2)")
    print("The answer to part 2 is \(part2Solution)")
    
}

main()