import UIKit

enum Operator{
    case add
    case subtract
    case multiply
    case divide
    case invert
    case percentage
}

enum OperandButtons {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case zero
    case dot
}


class Calculator {
    var value1: String = ""
    var value2: String = ""
    var value1HasDot: Bool = false
    var value2HasDot: Bool = false
    
    var op: Operator? = nil
    
    func printValues() {
        print("value1: \(value1), value2: \(value2)")
    }
    
    func numberButtonPressed(_ button: OperandButtons) {
        switch button {
        case .one:
            op == nil ? (value1.append("1"), printValues()) : (value2.append("1"), printValues())
        case .two:
            op == nil ? (value1.append("2"), printValues()) : (value2.append("2"), printValues())
        case .three:
            op == nil ? (value1.append("3"), printValues()) : (value2.append("3"), printValues())
        case .four:
            op == nil ? (value1.append("4"), printValues()) : (value2.append("4"), printValues())
        case .five:
            op == nil ? (value1.append("5"), printValues()) : (value2.append("5"), printValues())
        case .six:
            op == nil ? (value1.append("6"), printValues()) : (value2.append("6"), printValues())
        case .seven:
            op == nil ? (value1.append("7"), printValues()) : (value2.append("7"), printValues())
        case .eight:
            op == nil ? (value1.append("8"), printValues()) : (value2.append("8"), printValues())
        case .nine:
            op == nil ? (value1.append("9"), printValues()) : (value2.append("9"), printValues())
        case .zero:
            op == nil ? (value1.append("0"), printValues()) : (value2.append("0"), printValues())
        case .dot:
            if op == nil {
                if value1HasDot == true { return }
                value1.append(".")
                value1HasDot = true
                printValues()
            } else {
                if value2HasDot == true { return }
                value2.append(".")
                value2HasDot = true
                printValues()
            }
        }
    }
    
    func operatorButtonPressed(_ opPassed: Operator) {
        if value1.isEmpty { return }
        
        op = opPassed
        print(opPassed)
        if opPassed == .invert {
            guard value2.isEmpty else { print("Error: too many operands") ; return }
            equalButtonPressed()
        }
    }
    
    func clearButtonPressed() {
            value1 = ""
            value2 = ""
            op = nil
            value1HasDot = false
            value2HasDot = false
            print("All Cleared")
    }
    
    func equalButtonPressed() {
        if value1.isEmpty{ print("Error: no operands to operate on") ; return }
        if op == nil { print("Error: no operator to operate with") ; return }
        
        guard let value1Double = Double(value1) else { return }
        
        var value2Double: Double
        if let value2Check = Double(value2) { value2Double = value2Check } else { value2Double = 0.0 }
        
        switch op {
        case .add:
            let result = String(value1Double + value2Double)
            value1 = result
            value2 = ""
            op = nil
            print(result)
            
        case .subtract:
            let result = String(value1Double - value2Double)
            value1 = result
            value2 = ""
            op = nil
            print(result)
            
        case .multiply:
            let result = String(value1Double * value2Double)
            value1 = result
            value2 = ""
            op = nil
            print(result)
            
        case .divide:
            let result = String(value1Double / value2Double)
            value1 = result
            value2 = ""
            op = nil
            print(result)
            
        case .invert:
            let result = String(value1Double * -1)
            value1 = result
            value1HasDot = true
            value2 = ""
            op = nil
            print(result)
            
        case .percentage:
            let result = String(value1Double / 100)
            value1 = result
            value2 = ""
            op = nil
            print(result)
            
        case .none:
            return
        }
    }
}

let calculator = Calculator()

calculator.numberButtonPressed(.one)
calculator.operatorButtonPressed(.invert)
calculator.numberButtonPressed(.dot)
calculator.operatorButtonPressed(.multiply)
calculator.numberButtonPressed(.four)
calculator.clearButtonPressed()
calculator.numberButtonPressed(.two)
calculator.clearButtonPressed()


