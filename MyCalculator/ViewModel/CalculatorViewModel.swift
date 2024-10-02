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
    
    //MARK: - User intents
    func clickButton() {
        soundPlayer.playSound(named: "Click.m4a")
    }
    //MARK: 
    
}
