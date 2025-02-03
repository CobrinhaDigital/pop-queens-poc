//
//  Stage.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 27/01/25.
//
import SwiftUI

struct Stage: View {
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var colisions: [(line: Int, column: Int)] = []
    @State var divasPositions: [Int] = [1, 3, 5, 7]
    
    func hasCollision(_ index: Int) -> Bool {
        colisions.contains(where: { colision in
            colision.line == chessTable.tiles[index].line && colision.column == chessTable.tiles[index].column
        })
    }
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(130), spacing: 0), count: chessTable.columns), spacing: 0) {
                ForEach(chessTable.tiles.indices, id: \.self) { index in
                    Rectangle()
                        .border(.black, width: 1)
                        .aspectRatio(1, contentMode: .fill)
                        .foregroundStyle((chessTable.tiles[index].line + chessTable.tiles[index].column) % 2 == 0 ? RadialGradient(colors: [.white, .purple], center: .center, startRadius: 5, endRadius: 90) : RadialGradient(colors: [Color(.verdeCiano), .mint], center: .center, startRadius: 10, endRadius: 90))
                        .border(hasCollision(index) ? .red : .clear, width: 5)
                }
            }
            .onAppear() {
                chessTable.createTiles()
            }
        }
    }
}

#Preview {
    Stage()
}
