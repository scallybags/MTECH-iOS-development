import UIKit

//enum Move {
//    case rock, paper, scissors
//}
//
//enum Outcome {
//    case tie, player1Wins, player2Wins
//}
//
//func rockPaperScissors(player1: Move, player2: Move) -> Outcome {
//    guard player1 != player2 else { return .tie }
//    switch player1 {
//    case .rock:
//        return player2 == .paper ? .player2Wins : .player1Wins
//    case .paper:
//        return player2 == .scissors ? .player2Wins : .player1Wins
//    case .scissors:
//        return player2 == .rock ? .player2Wins : .player1Wins
//    }
//}
//let result = rockPaperScissors(player1: .paper, player2: .rock)
//print(result)

let names = ["Zach", "Parker", "Joe", "Andy"]

let counts = names.map { $0.count }

let closure = { (numbers: [Int]) -> Int in
        return 0
}

//let sortedTracks = tracks.sorted { (firstTrack: Track, secondTrack: Track) -> Bool in
//    return firstTrack.trackNumber < secondTrack.trackNumber
//}

let a = [1,2,3,4,5]
let b = a.sorted()
