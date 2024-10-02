//
//  CalculatorView.swift
//  MyCalculator
//
//  Created by IS 543 on 9/30/24.
//

import SwiftUI

//enum CalculatorButtonType {
//    case utility
//    case compute
//    case number
//    case doublewide
//    
//    var foregroundColor: Color {
//        self == .utility ? .black : .white
//    }
//    
//    var backgroundColor: Color {
//        switch self {
//            case .utility:
//                .utilityBackground
//            case .compute:
//                .computeBackground
//            case .number, .doublewide:
//                .numberBackground
//        }
//    }
//}

//typealias ButtonSpec = (label: String, type: CalculatorButtonType)

//let buttons: [[CalculatorButton1]] = [
//    [.digit(7), .digit(8), .digit(9), .operation(.divide)],
//    [.digit(4), .digit(5), .digit(6), .operation(.multiply)],
//    [.digit(1), .digit(2), .digit(3), .operation(.subtract)],
//    [.decimal, .digit(0), .equals, .operation(.add)]
//]

//let buttonSpecs: [ButtonSpec] = [
//    ("AC", .utility),   ("+/-", .utility),  ("%", .utility),    ("/", .compute),
//    ("7", .number),     ("8", .number),     ("9", .number),     ("x", .compute),
//    ("4", .number),     ("5", .number),     ("6", .number),     ("-", .compute),
//    ("1", .number),     ("2", .number),     ("3", .number),     ("+", .compute),
//    ("0", .doublewide), ("", .number),      (".", .number),     ("=", .compute),
//]

let columnCount = 4
let gridItems = Array<GridItem>(repeating: .init(.flexible()), count: columnCount)

struct CalculatorView: View {

    private struct Constants {
        static let displayFontSize = 90.0
    }

    var calculatorViewModel: CalculatorViewModel

    @State private var playSound: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(.black)
                    .ignoresSafeArea(.all)
                VStack(alignment: .trailing, spacing: DrawingConstants.buttonSpacing) {
                    Toggle("Play sound", isOn: $playSound)
                        .foregroundStyle(.white)
                    Spacer()
                    Text("1,000")
                        .font(.system(size: Constants.displayFontSize, weight: .thin))
                        .foregroundStyle(.white)
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
                                    calculatorViewModel: calculatorViewModel
                                )
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CalculatorView(calculatorViewModel: CalculatorViewModel())
}

//    var body: some View {
//        VStack {
//            Text("1,000")
//            LazyVGrid(columns: gridItems) {
//                ForEach(buttonSpecs, id: \.label) { buttonSpec in
//                    if buttonSpec.label == "" {
//                        Text("")
//                    } else {
//                        CalculatorButton(buttonSpec: buttonSpec,
//                                                calculatorViewModel: CalculatorViewModel())
//                    }
//                }
//            }
//        }
//        .padding()
//    }
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                Spacer()
//                Text(display)
//                    .font(.system(size: 72))
//                    .padding()
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                    .background(.white)
//                    .foregroundColor(.black)
//
//                ZStack {
//                    VStack {
//                        ForEach(buttons, id: \.self) { row in
//                            HStack {
//                                ForEach(row, id: \.self) { button in
//                                    Button(action: {
//                                        // NEEDS FUNCTION
//                                    }) {
//                                        Text(button.title)
//                                            .font(.system(size: 32))
//                                            .frame(width: self.buttonWidth(button: button, totalWidth: geometry.size.width),
//                                                   height: self.buttonHeight(totalWidth: geometry.size.width))
//                                            .foregroundColor(.white)
//                                            .background(button.backgroundColor)
//                                            .cornerRadius(10)
//                                            .padding(.horizontal, 6)
//                                            .shadow(radius: 8)
//                                    }
//                                }
//                            }
//                            //.padding(.bottom, 3)
//                            .padding(12)
//                        }
//                    }
//                    .padding(.horizontal, 6)
//                    .padding(.vertical, 32)
//                }
//                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
//                .cornerRadius(32)
//            }
//        }
//    }

//    func buttonWidth(button: CalculatorButton1, totalWidth: CGFloat) -> CGFloat {
//        return (totalWidth - 10 * 12) / 4 + 2
//    }
//
//    func buttonHeight(totalWidth: CGFloat) -> CGFloat {
//        return (totalWidth - 5 * 12) / 4
//    }
//
//    enum Operation {
//        case add, subtract, multiply, divide
//    }



//enum CalculatorButton1: Hashable {
//    case digit(Int)
//    case decimal
//    case equals
//    case operation(Operation)
//
//    var title: String {
//        switch self {
//        case .digit(let number): return "\(number)"
//        case .decimal: return "."
//        case .equals: return "="
//        case .operation(let operation):
//            switch operation {
//            case .add: return "+"
//            case .subtract: return "-"
//            case .multiply: return "×"
//            case .divide: return "÷"
//            }
//        }
//    }
//    var backgroundColor: Color {
//        switch self {
//        case .digit, .decimal:
//            return Color(red: 0.7, green: 0.7, blue: 0.7)
//        case .operation, .equals:
//            return Color.orange
//        }
//    }
//}
