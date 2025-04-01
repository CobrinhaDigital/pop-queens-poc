//
//  N1Board.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

struct N1Board: View {
    @State var chessTable: ChessTableModel = .init(rows: 1, columns: 1)
    @State var queens: [Queen] = [
        Queen(position: (0,0), diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100)))
    ]
    var body: some View {
        VStack {
            Stage(tileSize: 120, chessTable: $chessTable, queens: $queens)
            SubtitleTextBlock(text: "ok, i guess")
                .padding(.top, 10)
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        N1Board()
    }
}
