import Foundation

// let file = FileManager.default.currentDirectoryPath + "/input.txt"
// let path=URL(fileURLWithPath: file)
// guard let text=try? String(contentsOf: path) else {
//     fatalError("Unable to parse input file")
// }
// print(text, terminator: "")

// guard let contents: String = try? String(contentsOfFile: file) else {
//     fatalError("Failed to use contentsOfFile")
// }
// print(contents, terminator: "")

let resOpt = Bundle.module.url(forResource: "input", withExtension: "txt")

if let res = resOpt {
    guard let fileContents = try? String(contentsOf: res) else {
        fatalError("Bundle contents were not nil but failed to read them")
    }
    print(fileContents)
} else {
    print("resource was nil")
}
