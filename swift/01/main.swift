import Foundation
import MyCommon

let digitsCharacters = CharacterSet(charactersIn: "0123456789") 

func convertStringNumberWords(_ input: String) -> String {
    return input
        .replacingOccurrences(of: "one", with: "1")
        .replacingOccurrences(of: "two", with: "2")
        .replacingOccurrences(of: "three", with: "3")
        .replacingOccurrences(of: "four", with: "4")
        .replacingOccurrences(of: "five", with: "5")
        .replacingOccurrences(of: "six", with: "6")
        .replacingOccurrences(of: "seven", with: "7")
        .replacingOccurrences(of: "eight", with: "8")
        .replacingOccurrences(of: "nine", with: "9")
        .replacingOccurrences(of: "zero", with: "0")
}

func part1(lines: [String]) -> Int {
    var sum = 0

    for line in lines {
        let lineNumbers = line.filter("0123456789".contains)
        
        let firstDigit = lineNumbers.first?.wholeNumberValue
        let lastDigit = lineNumbers.last?.wholeNumberValue

        if let d1 = firstDigit, let d2 = lastDigit {
            sum += (d1 * 10) + d2
        } else {
            print("Error in finding digit sum in \(line)")
        }
    }

    return sum
}

func part2(lines: [String]) -> Int {
    var sum = 0

    for line in lines {
        var lineCpy = line // make copy just to play it safe

        var convertedLine = String()
        while lineCpy.count > 0 {
            convertedLine += String(lineCpy.first!)
            convertedLine = convertStringNumberWords(convertedLine)
            lineCpy = String(lineCpy.dropFirst())
        }

        lineCpy = line
        var convertedLineReverse = String()
        while lineCpy.count > 0 {
            convertedLineReverse = String(lineCpy.last!) + convertedLineReverse
            convertedLineReverse = convertStringNumberWords(convertedLineReverse)
            lineCpy = String(lineCpy.dropLast())
        }

        let lineNumbers = convertedLine.filter("1234567890".contains)
        let lineNumbers2 = convertedLineReverse.filter("12345567890".contains)

        if lineNumbers.count < 1 {
            continue
        }
        
        let firstDigit = lineNumbers.first?.wholeNumberValue
        let lastDigit = lineNumbers2.last?.wholeNumberValue

        if let d1 = firstDigit, let d2 = lastDigit {
            sum += (d1 * 10) + d2
            print(line, convertedLine, lineNumbers, (d1 * 10) + d2, sum, separator: "\n")
        } else {
            print("Error in finding digit sum in \(line)")
        }

    }
    
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