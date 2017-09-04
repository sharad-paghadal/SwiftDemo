//
//  calculatorBrain.swift
//  Calculator
//
//  Created by Sharad Paghadal on 07/01/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import Foundation

class calculatorBrain{
    
    private var accumulator = 0.0
    private var internalProgram = [AnyObject]()
    
    func setOperand(operand : Double){
        accumulator = operand
        internalProgram.append(operand as AnyObject)
    }
    
    var operations : Dictionary<String,Operation> =  [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "cos" : Operation.UnaryOperation(cos),
        "√" : Operation.UnaryOperation(sqrt),
        "±" : Operation.UnaryOperation({-$0}),
        "×" : Operation.BinaryOperation({$0 * $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "-" : Operation.BinaryOperation({$0 - $1}),
        "=" : Operation.Equals
    ]
    
    struct pendingBinaryValue {
        var binaryFunction : (Double,Double) -> Double
        var firstOperand : Double
    }
    
    private var pending : pendingBinaryValue?
    
    typealias propertyList = AnyObject
    
    var program : propertyList{
        get{
            return internalProgram as calculatorBrain.propertyList
        }
        set{
            clean()
            if let arrrayOfOps = newValue as? [AnyObject]{
                for op in arrrayOfOps{
                    if let operand = op as? Double{
                        setOperand(operand: operand)
                    }else if let operation = op as? String{
                        performOperation(symbol: operation)
                    }
                }
            }
        }
    }
    
    func clean(){
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    func performOperation(symbol : String){
        internalProgram.append(symbol as AnyObject)
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation (let foo) :
                accumulator = foo(accumulator) //foo is just a function name
            case .BinaryOperation (let fn) :
                executePendingBinaryOperation()
                pending = pendingBinaryValue(binaryFunction: fn, firstOperand: accumulator)
            case .Equals :
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation(){
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    var result : Double {
        get{
            return accumulator
        }
    }
}
