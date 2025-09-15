import UIKit

enum Operator{
    case add
    case subtract
    case multiply
    case divide
}

class Calculator {
    var value1: [Int] = []
    var value2: [Int] = []
    var op: Operator? = nil
    
    func numberButtonPressed(number: Int) {
        if op == nil {
            value1.append(number)
        } else {
            value2.append(number)
        }
    }
    
    func operatorButtonPressed(_ opPassed: Operator) {
        op = opPassed
    }
    
    func clearButtonPressed() {
        value1 = []
        value2 = []
        op = nil
    }
    
    func equalButtonPressed() -> Int? {
        if value1.isEmpty{ return nil }
        let value1String = (value1.map{String($0)}).joined()
        guard let value1Int = Int(value1String) else {return nil}
        
        if value2.isEmpty{ return nil }
        let value2String = (value1.map { String($0) }).joined()
        guard let value2Int = Int(value2String) else {return nil}
        
        switch op {
        case .add:
            let result = value1Int + value2Int
            return result
        case .subtract:
            let result = value1Int - value2Int
            return result
        case .multiply:
            let result = value1Int * value2Int
            return result
        case .divide:
            let result = value1Int / value2Int
            return result
        case .none:
            return nil
        }
    }
}

let myCalculator = Calculator()
myCalculator.numberButtonPressed(number: 3 )
