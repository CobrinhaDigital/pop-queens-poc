//
//  TextEnum.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

enum TextEnum {
    case h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30, h31, h32, h33, h34, h35, h36, h37, h38, h39, h40, h41, h42, h43, h44, h45, h46, h47, h48
    
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
            text = "They are the available spaces for the queens in order to fulfill the puzzle's conditions."
        case .h11:
            text = "For instance, take the 4x4 stage the divas were given."
        case .h12:
            text = "These are all solutions for N = 4."
        case .h13:
            text = "Suppose you got three out of four stages right, until the last one."
        case .h14:
            text = "You could undo all your progress and try again, but..."
        case .h15:
            text = "What if there was something... better?"
        case .h16:
            text = "If you find yourself stuck, just take a step back."
        case .h17:
            text = "Not every queen was placed in the wrong tile, maybe it was just one!"
        case .h18:
            text = "It's pretty close, but there's an issue."
        case .h19:
            text = "Rebeca is colliding with all three divas, not ideal at all."
        case .h20:
            text = "Let's take her out of the stage for a moment, shall we?"
        case .h21:
            text = "Knowing that the queen can move horizontally, vertically and diagonally, we can trace their movements like this..."
        case .h22:
            text = "Wow, that's a lot!"
        case .h23:
            text = "But there's a place no line crosses."
        case .h24:
            text = "You can go back as many times you need using this strategy."
        case .h25:
            text = "Worst case scenario, you'd end up with this..."
        case .h26:
            text = "Which is not much better than cleaning up the entire board."
        case .h27:
            text = "But isn't there a better, more efficient way to do this?"
        case .h28:
            text = "Unfortunately, no."
        case .h29:
            text = "But why?"
        case .h30:
            text = "To answer that, we need to take a look at how computers work."
        case .h31:
            text = "I know it's crazy, but hear me out, ok?"
        case .h32:
            text = "So, while solving the puzzle, we follow three instructions before placing a diva somewhere in the stage."
        case .h33:
            text = "And we do that multiple times until all divas are placed somewhere 'safe', where there won't happen any accidents during their performances."
        case .h34:
            text = "These are a set of finite, sequential and well defined instructions."
        case .h35:
            text = "In other words, an algorithm."
        case .h36:
            text = "Computers run algorithms all the time and they can solve the N-Queens puzzle, if given the proper instructions."
        case .h37:
            text = "But all computers are unique and for that reason we can't really measure how long they will take to run an algorithm."
        case .h38:
            text = "For that, we use Big-O notation."
        case .h39:
            text = "In short, Big-O describes the time an algorithm takes to be completed through a function, which can be represented through a curve in a graph."
        case .h40:
            text = "The X axis represents the size of the algorithm's input and the Y axis represents how many operations the algorithm does to complete its task."
        case .h41:
            text = "The relationship between the number of operations and the size of the input is called time complexity."
        case .h42:
            text = "The steeper the curve, the more inefficient an algorithm is."
        case .h43:
            text = "For our dismay, the N-Queens puzzle time complexity is between O(N!) and O(2ⁿ) using backtracking."
        case .h44:
            text = "And it literally can't get any better than this because-"
        case .h45:
            text = "But-"
        case .h46:
            text = "Ugh, fine..."
        case .h47:
            text = "It's alright..."
        case .h48:
            text = "Sure! Thanks, Rose."
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
