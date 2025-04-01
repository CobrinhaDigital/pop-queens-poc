//
//  N3Board.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

struct N3Board: View {
    @State var chessTable: ChessTableModel = .init(rows: 3, columns: 3)
    @State var queens: [Queen] = [
        Queen(
            position: (0,1),
            diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen(
            position: (1,2),
            diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen(
            position: (2,0),
            diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        )
    ]
    var body: some View {
        VStack {
            Stage(tileSize: 95, chessTable: $chessTable, queens: $queens)
            SubtitleTextBlock(text: "fine, point taken", outerWidth: 170, innerWidth: 165)
                .padding(.top, 10)
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        N3Board()
    }
}
