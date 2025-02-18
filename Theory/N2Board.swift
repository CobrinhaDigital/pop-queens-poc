//
//  N2Board.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

struct N2Board: View {
    @State var chessTable: ChessTableModel = .init(rows: 2, columns: 2)
    @State var queens: [Queen] = [
        Queen(
            position: (1,0),
            diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen(
            position: (0,1),
            diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        )
    ]
    var body: some View {
        VStack {
            Stage(tileSize: 110, chessTable: $chessTable, queens: $queens)
            SubtitleTextBlock(text: "oh, that's not...", outerWidth: 145, innerWidth: 140)
                .padding(.top, 10)
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        N2Board()
    }
}
