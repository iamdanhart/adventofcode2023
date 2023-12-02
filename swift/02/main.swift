import Foundation
import MyCommon

struct CubeSet {
    public var numRed: Int = 0
    public var numGreen: Int = 0
    public var numBlue: Int = 0
}

struct GamePart1 {
    public var gameValue: Int = 0
    public var cubeSets: [CubeSet] = Array()
}

func extractValuesFromGamePart1(_ line: String) -> GamePart1 {
    let gameAndSets = line.components(separatedBy: ":")
    let gameNumber = Int(gameAndSets[0].filter("1234567890".contains))

    var cubeSets: [CubeSet] = Array()
    for cubeSetRecord in gameAndSets[1].components(separatedBy: ";") {
        var cubeSet = CubeSet()

        let cubeSetNoSpaces = 
            cubeSetRecord.replacingOccurrences(of: " ", with: "")
        for cubeCount in cubeSetNoSpaces.components(separatedBy: ",") {
            let numCubes = Int(cubeCount.filter("1234567890".contains))
            if (cubeCount.contains("red")) {
                cubeSet.numRed = numCubes!
            } else if (cubeCount.contains("blue")) {
                cubeSet.numBlue = numCubes!
            } else {
                cubeSet.numGreen = numCubes!
            }
        }
        cubeSets.append(cubeSet)
    }

    var game = GamePart1()
    game.gameValue = gameNumber!
    game.cubeSets = cubeSets

    return game
}

func validateGamePart1(_ game: GamePart1) -> Bool {
    let possibleRed = 12
    let possibleGreen = 13
    let possibleBlue = 14

    for cubeSet in game.cubeSets {
        if (cubeSet.numRed > possibleRed 
            || cubeSet.numBlue > possibleBlue
            || cubeSet.numGreen > possibleGreen) {
            return false
        }
    }
    return true
}

func validateGamePart2(_ game: GamePart1) -> CubeSet {
    var minRed = 0
    var minBlue = 0
    var minGreen = 0

    for cubeSet in game.cubeSets {
        minRed = max(minRed, cubeSet.numRed)
        minGreen = max(minGreen, cubeSet.numGreen)
        minBlue = max(minBlue, cubeSet.numBlue)
    }

    var minPossibleCubeSet = CubeSet()
    minPossibleCubeSet.numRed = minRed
    minPossibleCubeSet.numGreen = minGreen
    minPossibleCubeSet.numBlue = minBlue

    return minPossibleCubeSet
}

func part1(lines: [String]) -> Int {
    var sum = 0

    for line in lines {
        if (line.count < 1) {
            continue
        }
        let game = extractValuesFromGamePart1(line)
        if (validateGamePart1(game)) {
            sum += game.gameValue
        }
    }

    return sum
}

func part2(lines: [String]) -> Int {
    var sum = 0

    for line in lines {
        if (line.count < 1) {
            continue
        }
        let game = extractValuesFromGamePart1(line)
        let minPossibleGameSet = validateGamePart2(game)
        sum += minPossibleGameSet.numRed 
            * minPossibleGameSet.numGreen 
            * minPossibleGameSet.numBlue
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