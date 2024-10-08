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

    @Bindable var calculatorViewModel: CalculatorViewModel

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .trailing, spacing: DrawingConstants.buttonSpacing) {
                    accumulatorBody
                    buttonGrid(for: geometry)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    var accumulatorBody: some View {
        GeometryReader {geometry in
            VStack(alignment: .trailing) {
                Toggle("Play sound", isOn: $calculatorViewModel.preferences.soundIsEnabled
                )
                .foregroundStyle(.black)
                .padding()
                
                Spacer()
                
                Text(calculatorViewModel.displayText)
                    .font(systemFont(for: calculatorViewModel.displayText,
                                     thatFirst: geometry.size.width
                                     - DrawingConstants.buttonSpacing * 2,
                                     desiredSize: Constants.displayFontSize))
                    .foregroundStyle(.black)
                    .padding(.trailing, DrawingConstants.buttonSpacing)
                
            }
        }
    }
    
    func buttonGrid(for geometry: GeometryProxy) -> some View {
        LazyVGrid(columns: gridItems, alignment: .leading, spacing: DrawingConstants.buttonSpacing) {
            ForEach(buttonSpecs, id: \.symbol.rawValue) { buttonSpec in
                if buttonSpec.symbol == .placeholder {
                    Text("")
                } else {
                    CalculatorButton(
                        buttonSpec: buttonSpec,
                        size: geometry.size,
                        calculatorViewModel: calculatorViewModel
                    )
                }
            }
        }
        .padding(.top, DrawingConstants.buttonSpacing)
        .padding(.leading, DrawingConstants.buttonSpacing)
        .padding(.bottom, DrawingConstants.safeAreaPadding)
        .background(.buttonAreaBackground)
        .clipShape(UnevenRoundedRectangle(
            topLeadingRadius: DrawingConstants.buttonAreaRadius,
            topTrailingRadius: DrawingConstants.buttonAreaRadius))
    }
}

#Preview {
    CalculatorView(calculatorViewModel: CalculatorViewModel())
}
