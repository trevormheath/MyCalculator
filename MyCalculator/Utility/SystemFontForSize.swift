//
//  SystemFontForSize.swift
//  MyCalculator
//
//  Created by IS 543 on 10/7/24.
//

import SwiftUI

func systemFont(for string: String, thatFirst width: Double, desiredSize: Double) -> Font {
    var fontSize = desiredSize
    var uiFont = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
    
    
    while (string as NSString).size(withAttributes: [.font: uiFont]).width > width
    && fontSize >= desiredSize / 3 {
        fontSize *= 0.95
        uiFont = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
    }
    
    return Font.system(size: fontSize, weight: .semibold)
}
