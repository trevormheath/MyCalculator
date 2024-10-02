//
//  CalculatorBrain.swift
//  MyCalculator
//
//  Created by IS 543 on 10/1/24.
//

import Foundation

struct CalculatorBrain {
    // MARK: - Nested types

    private enum Operation {
        case binary((Double, Double) -> Double)
        case unary((Double) -> Double)
        case calculate
    }

    // MARK: - Constants

    // MARK: - Properties
    var accumulator: Double? = 0
    var leftOperand: Double?

    enum pendingOperator {
        case divide
        case multiply
        case subtract
        case add
    }
    
    // MARK: - Helpers
    func getLeftOperand() -> Double? {
        leftOperand
    }
    
    func clear() {}
    func allClear() {}
    func convertPercent() {}
    mutating func negateAccumulator() {
        if let tempAccumulator: Double = accumulator {
            accumulator = -tempAccumulator
        }
    }
    mutating func setAccumulator(_ value: Double) {
        accumulator = value
    }
    mutating func accumulate(_ value: Double) {
        if let tempAccumulator: Double = accumulator {
            accumulator = tempAccumulator + value
        }
    }
}
