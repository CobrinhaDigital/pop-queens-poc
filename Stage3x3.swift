//
//  Stage3x3.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 12/02/25.
//
import SwiftUI
import Foundation

struct Stage3x3: View {
    @State var chessTable: ChessTableModel = .init(rows: 3, columns: 3)
    @State var queens: [Queen] = []
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(80), spacing: 0), count: chessTable.columns), spacing: 0) {
            ForEach(chessTable.tiles.indices, id: \.self) { index in
                Rectangle()
                    .border(.black, width: 1)
                    .aspectRatio(1, contentMode: .fill)
                    .foregroundStyle((chessTable.tiles[index].line + chessTable.tiles[index].column) % 2 == 0 ? RadialGradient(colors: [.white, .purple], center: .center, startRadius: 2.5, endRadius: 90) : RadialGradient(colors: [Color(.verdeCiano), .mint], center: .center, startRadius: 5, endRadius: 90))
                    .onAppear() {
                        queens.append(contentsOf: [
                            Queen(
                                position: (line: 1, column: 2),
                                diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: (CGSize(width: 50, height: 50)), selectedSize: (CGSize(width: 70, height: 70)))
                            ),
                            Queen (
                                position: (line: 3, column: 4),
                                diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: (CGSize(width: 50, height: 50)), selectedSize: (CGSize(width: 70, height: 70)))
                            )
                        ])
                    }
                    .overlay(
                        Text("aaaa")
                    )
            }
        }
        .onAppear() {
            chessTable.createTiles()
        }
    }
}

#Preview {
    Stage3x3()
}
