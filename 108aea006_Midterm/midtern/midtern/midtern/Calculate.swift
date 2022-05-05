import Foundation
struct Calculate{

    private var pendingBinaryOperation: PendingBinaryOperation?
    private var equalCount = 0
    private var accumulator: Float?
    
    private let operations: [String: Operation] = [
        "+/-": .unary(-),
        "+": .binary(+),
        "-": .binary(-),
        "×": .binary(*),
        "÷": .binary(/),
        "=": .equals
    ]
    
    var result: Float?{
        return accumulator
    }
    
    enum Operation{
        case unary((Float) -> Float)
        case binary((Float,Float) -> Float)
        case equals
    }
    
    private struct PendingBinaryOperation {
        let function:(Float,Float) -> Float
        let firstOperand: Float
        
    func perform(with secondOperand: Float) -> Float{
            return function(firstOperand,secondOperand)
        }
    }
    
    mutating func setOperand(_ operand: Float){
        accumulator = operand
    }
    
    mutating func performOperation(_ symbol: String){
        let operation = operations[symbol]!
        
        switch operation {
        case .unary(let function):
            if let operand = accumulator{
                accumulator = function(operand)
                equalCount = 0
            }
        case .binary(let function):
            if let firstOprand = accumulator{
                pendingBinaryOperation = PendingBinaryOperation(function: function,firstOperand: firstOprand)
                accumulator = nil
                equalCount = 0
            }
        case .equals:
            if let operation = pendingBinaryOperation, let secondOperand = accumulator, equalCount == 0{
                accumulator = operation.perform(with: secondOperand)
                equalCount = 1
            }
        }
    }
 
}
