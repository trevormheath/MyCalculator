//
//  CalculatorViewModel.swift
//  MyCalculator
//
//  Created by IS 543 on 9/26/24.
//

import Foundation

@Observable class CalculatorViewModel {
    //MARK: Properties
    var soundPlayer = SoundPlayer()
    
    
    //MARK: - Model Access
    var pendingOperator: CalculatorBrain.pendingOperator?
    var leftOperand: Double?
    var accumulator: String?
    
    //MARK: - User intents
    func clickButton(playSound: Bool, on button: CalculatorButton) {
        if (playSound) {
            soundPlayer.playSound(named: "Click.m4a")
        }
        
        switch button.buttonSpec.type {
        case .number, .doublewide:
            setDisplayValue(button.buttonSpec.symbol.rawValue)
        default:
            return
        }
        
    }
    func setDisplayValue(_ value: String) {
        accumulator = value
    }
    func setDisplayValue(_ value: Double) {
        accumulator = String(value)
    }
    
//    func buttonClicked(_ button: CalculatorButton) {
//        switch button.buttonSpec.symbol {
//        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
//            setDisplayValue(displayValue?.appending(button.labeledContentStyle.rawValue) ?? button.labeledContentStyle.rawValue)
//        case .clear:
//            CalculatorBrain.clear()
//        case .allClear:
//            CalculatorBrain.allClear()
//        case .calculate:
//            evaluate()
//        case .changeSign:
//            CalculatorBrain.negateAccumulator()
//        case:
//            return
//        }
//    }
}
