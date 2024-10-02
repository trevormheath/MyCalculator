//
//  CalculatorView.swift
//  MyCalculator
//
//  Created by IS 543 on 9/30/24.
//

import SwiftUI

let columnCount = 4
let gridItems = Array<GridItem>(repeating: .init(.flexible()), count: columnCount)

struct CalculatorView: View {

    private struct Constants {
        static let displayFontSize = 90.0
    }

    var calculatorViewModel: CalculatorViewModel

    @State private var playSound: Bool = false
    @State private var displayValue: String = ""

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(.white)
                    .ignoresSafeArea(.all)
                
                VStack(alignment: .trailing, spacing: DrawingConstants.buttonSpacing) {
                    Toggle("Play sound", isOn: $playSound)
                        .foregroundStyle(.black)
                        .padding()
                    Spacer()
                    
                    Text(String(displayValue))
                        .font(.system(size: Constants.displayFontSize, weight: .medium))
                        .foregroundStyle(.black)
                        .padding(.trailing, DrawingConstants.buttonSpacing)
                    
                    LazyVGrid(columns: gridItems, alignment: .leading, spacing: DrawingConstants.buttonSpacing) {
                        ForEach(buttonSpecs, id: \.symbol.rawValue) { buttonSpec in
                            if buttonSpec.symbol == .placeholder {
                                Text("")
                            } else {
                                CalculatorButton(
                                    buttonSpec: buttonSpec,
                                    playSound: playSound,
                                    size: geometry.size,
                                    calculatorViewModel: calculatorViewModel,
                                    returnValue: {value in
                                        displayValue += value}
                                )
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, DrawingConstants.safeAreaPadding)
                    .background(.buttonAreaBackground)
                    .clipShape(UnevenRoundedRectangle(
                        topLeadingRadius: DrawingConstants.buttonAreaRadius,
                        topTrailingRadius: DrawingConstants.buttonAreaRadius))
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

#Preview {
    CalculatorView(calculatorViewModel: CalculatorViewModel())
}
