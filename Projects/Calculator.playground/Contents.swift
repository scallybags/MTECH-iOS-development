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
    // our two operand values are stored as strings so we can
    var value1: String = ""
    var value2: String = ""
    var value1HasDot: Bool = false
    var value2HasDot: Bool = false
    
    var currentOperator: Operator? = nil
    
    func printValues() {
        print("value1: \(value1), value2: \(value2)")
    }
    
    
    
    // number button function.
    func numberButtonPressed(_ button: OperandButtons) {
        switch button {
        case .one:
            currentOperator == nil ? (value1.append("1"), printValues()) : (value2.append("1"), printValues())
        case .two:
            currentOperator == nil ? (value1.append("2"), printValues()) : (value2.append("2"), printValues())
        case .three:
            currentOperator == nil ? (value1.append("3"), printValues()) : (value2.append("3"), printValues())
        case .four:
            currentOperator == nil ? (value1.append("4"), printValues()) : (value2.append("4"), printValues())
        case .five:
            currentOperator == nil ? (value1.append("5"), printValues()) : (value2.append("5"), printValues())
        case .six:
            currentOperator == nil ? (value1.append("6"), printValues()) : (value2.append("6"), printValues())
        case .seven:
            currentOperator == nil ? (value1.append("7"), printValues()) : (value2.append("7"), printValues())
        case .eight:
            currentOperator == nil ? (value1.append("8"), printValues()) : (value2.append("8"), printValues())
        case .nine:
            currentOperator == nil ? (value1.append("9"), printValues()) : (value2.append("9"), printValues())
        case .zero:
            currentOperator == nil ? (value1.append("0"), printValues()) : (value2.append("0"), printValues())
        case .dot:
            //The dot logic to determine how whether a . is already in either value.
            if currentOperator == nil { // if empty the dot should be added to value1 else value2
                if value1HasDot == true { return } // if the value already has a . return
                value1.append(".")
                value1HasDot = true // set has . to true.
                printValues()
            } else { // else case if we are to add the . to value2
                if value2HasDot == true { return }
                value2.append(".")
                value2HasDot = true
                printValues()
            }
        }
    }
    
    

    func operatorButtonPressed(_ opPassed: Operator) {
        if value1.isEmpty { return }
        
        currentOperator = opPassed
        print(opPassed)
        if opPassed == .invert {
            guard value2.isEmpty else { print("Error: too many operands") ; return }
            equalButtonPressed()
        }
    }
    
    
    
    func clearButtonPressed() {
        //I used nested functions for clean readable logic.
        //if both values are empty clear else allClear
        !value2.isEmpty && !value1.isEmpty ? clear() : allClear()
        
        func clear() {
            value2 = ""
            value2HasDot = false
            print("cleared")
            printValues()
        }
        
        func allClear() {
            value1 = ""
            value2 = ""
            currentOperator = nil
            value1HasDot = false
            value2HasDot = false
            print("All Cleared")
            printValues()
        }
    }
    
    
    
    func equalButtonPressed() {
        // check if we can perform an operation.
        if value1.isEmpty{ print("Error: no operands to operate on") ; return }
        if currentOperator == nil { print("Error: no operator to operate with") ; return }
        
        // if we can't unwrap value1 also return
        guard let value1Double = Double(value1) else { return }
        
        // we check value2 differently because it could still be an empty string
        // we initalize the variable in this case first so...
        // we can use an "if let" to set it later if not set to o.o
        var value2Double: Double
        if let value2Check = Double(value2) { value2Double = value2Check } else { value2Double = 0.0 }
        
        switch currentOperator {
        case .add:
            let result = String(value1Double + value2Double)
            value1 = result
            value2 = ""
            currentOperator = nil
            print("result: \(result)")
            
        case .subtract:
            let result = String(value1Double - value2Double)
            value1 = result
            value2 = ""
            currentOperator = nil
            print("result: \(result)")
            
        case .multiply:
            let result = String(value1Double * value2Double)
            value1 = result
            value2 = ""
            currentOperator = nil
            print("result: \(result)")
            
        case .divide:
            let result = String(value1Double / value2Double)
            value1 = result
            value2 = ""
            currentOperator = nil
            print("result: \(result)")
            
        case .invert:
            let result = String(value1Double * -1)
            value1 = result
            value1HasDot = true
            value2 = ""
            currentOperator = nil
            print("result: \(result)")
            
        case .percentage:
            let result = String(value1Double / 100)
            value1 = result
            value1HasDot = true
            value2 = ""
            currentOperator = nil
            print("result: \(result)")
            
        // since currentOperator is an optional we must have a ".none" case for the switch statement to be exhaustive.
        case .none:
            return
        }
        printValues()
    }
}

let calculator = Calculator()

calculator.numberButtonPressed(.seven)
calculator.numberButtonPressed(.five)
calculator.operatorButtonPressed(.percentage)
calculator.equalButtonPressed()


