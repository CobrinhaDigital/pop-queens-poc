//
//  Instructions.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 22/02/25.
//
import SwiftUI
import Foundation

struct Instructions: View {
    var body: some View {
        VStack(spacing: 35) {
            SubtitleTextBlock(text: "• See if there's someone that could bump into her vertically", outerWidth: 600, outerHeight: 60, innerWidth: 595, innerHeight: 55)
            SubtitleTextBlock(text: "• Check for any fellow divas on both sides", outerWidth: 600, outerHeight: 60, innerWidth: 595, innerHeight: 55)
            SubtitleTextBlock(text: "• Make sure there are no divas in any of her four diagonals", outerWidth: 600, outerHeight: 60, innerWidth: 595, innerHeight: 55)
        }
    }
}

struct InstructionsAndStage: View {
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var queens: [Queen] = [
        Queen(position: (1,1), diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (1,2), diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (2,1), diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (2,2), diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100)))
    ]
    
    var body: some View {
        HStack(spacing: -50) {
            Instructions()
            Stage(chessTable: $chessTable, queens: $queens)
        }
        .padding(.leading, 60)
    }
}

#Preview {
    ZStack {
        Color.blue
        InstructionsAndStage()
    }
}
