//
//  TwoArrowsBoard.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 19/02/25.
//
import SwiftUI
import Foundation

struct TwoArrowsBoard: View {
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var queens: [Queen] = [
        Queen(position: (1, 3), diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (2, 0), diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (0, 1), diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (3,1), diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100)))
    ]
    
    var body: some View {
        ZStack {
            Stage(chessTable: $chessTable, queens: $queens)
            Image(systemName: "arrow.up")
                .resizable()
                .position(x: -20, y: 75)
                .frame(width: 40, height: 150)
        }
    }
}

#Preview {
    TwoArrowsBoard()
}
