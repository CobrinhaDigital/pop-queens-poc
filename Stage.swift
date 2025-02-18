//
//  Stage.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 27/01/25.
//
import SwiftUI

struct Stage: View {
    @State var tileSize: CGFloat?
    //posicao de cada imagem
    @Binding var chessTable: ChessTableModel
    //preencher lista com posicoes predeterminadas de queens
    @Binding var queens: [Queen]
    
    @State var colisions: [(line: Int, column: Int)] = []
    @State var divasPositions: [Int] = [1, 3, 5, 7]
    //limitar numero de cliques
    var onTap: (() -> Diva?)?
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(tileSize ?? 85), spacing: 0), count: chessTable.columns), spacing: 0) {
                ForEach(chessTable.tiles.indices, id: \.self) { index in
                    Rectangle()
                        .border(.black, width: 1)
                        .aspectRatio(1, contentMode: .fill)
                        .foregroundStyle((chessTable.tiles[index].line + chessTable.tiles[index].column) % 2 == 0 ? RadialGradient(colors: [.white, .purple], center: .center, startRadius: 2.5, endRadius: 90) : RadialGradient(colors: [Color(.verdeCiano), .mint], center: .center, startRadius: 5, endRadius: 90))
                        .onTapGesture {
                            //colocar boneca no canto
                            if let diva = onTap?() {
                                withAnimation {
                                    let newQueen = Queen(
                                        position: (
                                            line: chessTable.tiles[index].line,
                                            column: chessTable.tiles[index].column
                                        )
                                    )
                                    newQueen.diva = diva
                                    queens.append(newQueen)
                                    chessTable.tiles[index].image = diva.image
                                }
                                //tirar boneca do canto
                            } else {
                                if let _ = onTap {
                                    withAnimation(.smooth) {
                                        let currentPosition = (chessTable.tiles[index].line, chessTable.tiles[index].column)
                                        if let selectedQueen = queens.first(where: { queen in
                                            queen.position == currentPosition
                                        }) {
                                            removeDivaFromBoard(selectedQueen, at: index)
                                        }
                                    }
                                }
                            }
                        }
                        .overlay {
                            chessTable.tiles[index].image.map { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.all, 5)
                                    .allowsHitTesting(false)
                            }
                        }
                }
            }
            .onAppear() {
                chessTable.createTiles()
            }
        }
        .onAppear {
            queens.forEach { queen in
                if let index = chessTable.tiles.firstIndex(where: { tile in
                    tile.line == queen.position.line && tile.column == queen.position.column
                }) {
                    chessTable.tiles[index].image = queen.diva?.image

                }
            }
        }
    }
    
    private func removeDivaFromBoard(_ toRemove: Queen, at index: Int) {
        chessTable.tiles[index].image = nil
        queens.removeAll { queen in toRemove == queen }
    }
}

#Preview {
    Stage(chessTable: .constant(.init(rows: 4, columns: 4)), queens: .constant([]))
}
