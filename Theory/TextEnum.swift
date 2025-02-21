//
//  TextEnum.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

enum TextEnum {
    case h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19
    
    func text() -> String {
        var text: String = ""
        switch self {
        case .h1:
            text = "The problem faced by the divas goes waaaay back..."
        case .h2:
            text = "To the 18th century."
        case .h3:
            text = "Proposed by Max Bezzel in 1848, it fascinated many mathematicians from the time, including Carl Friedrich Gauss."
        case .h4:
            text = "At first, an 8x8 chess board was used and the goal was to place 8 queens in a way they could not attack each other."
        case .h5:
            text = "The first solution was presented by Franz Nauck in 1850."
        case .h6:
            text = "It was later generalized to the N-Queens puzzle, in which N ≥ 4."
        case .h7:
            text = "While solving the puzzle, did you struggle to place the last diva?"
        case .h8:
            text = "If so, it means you ran out of states."
        case .h9:
            text = "But what are those?"
        case .h10:
            text = "They are the available spaces for the qeeuns in order to fulfill the puzzle's conditions."
        default:
            text = "yippee"
        }
        return text
    }
}

struct TextEnumView: View {
    var body: some View {
        Text(TextEnum.h1.text())
    }
}

#Preview {
    TextEnumView()
}
