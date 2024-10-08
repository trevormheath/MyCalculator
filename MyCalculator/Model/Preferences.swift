//
//  Preferences.swift
//  MyCalculator
//
//  Created by IS 543 on 10/7/24.
//

import Foundation

struct Preferences {
    var soundIsEnabled = UserDefaults.standard.bool(forKey: Key.soundEnabled) {
        didSet {
            UserDefaults.standard.set(soundIsEnabled, forKey: Key.soundEnabled)
        }
    }

    private struct Key {
        static let soundEnabled = "EnableSound"
    }
}
