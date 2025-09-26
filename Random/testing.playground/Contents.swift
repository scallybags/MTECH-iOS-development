import UIKit
import SwiftUI
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

//let names = ["Zach", "Parker", "Joe", "Andy"]
//
//let counts = names.map { $0.count }
//
//let closure = { (numbers: [Int]) -> Int in
//        return 0
//}

//let sortedTracks = tracks.sorted { (firstTrack: Track, secondTrack: Track) -> Bool in
//    return firstTrack.trackNumber < secondTrack.trackNumber
//}

//let a = [1,2,3,4,5]
//let b = a.sorted()



//struct MyView: View { //1
//    var weirdVar = 42 //1
//    var anotherOne = "hello" //1
//    
//    var body: some View {
//        VStack{
//            Text("Title")
//                .font(.largeTitle)
//                .foregroundColor(.red)
//                .padding()
//                .background(Color.yellow)
//                .cornerRadius(10)
//                .shadow(radius:5)
//                .padding()
//                .border(Color.black)
//                .padding(5)
//                .opacity(0.9)
//            
//            HStack(spacing:3){
//                Text("Count: \(myFunc( x: weirdVar ))")
//                    .font(.body)
//                    .padding()
//                    .background(Color.green)
//                    .cornerRadius(3)
//                
//                Button("Click"){
//                    print("button clicked")
//                }
//            }
//            .padding(3)
//            .background(Color.gray)
//            .cornerRadius(7)
//            
//        }
//        .padding(1)
//        .background(Color.blue)
//        .cornerRadius(4)
//        .padding(2)
//    }
//}
//
//// bad function name and inconsistent parameters
//func myFunc(x:Int)->Int{
//    var total = 0
//    for i in 0...x { total += i }
//    if total > 100 {
//        print("big number")
//    } else {
//        print("small")
//    }
//    return total
//}
//
//// inconsistent struct name, weird capitalization
//struct ContentView: View {
//    var body: some View {
//        MyView()
//    }
//}







