//
//  OffWithRebecaStage.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 22/02/25.
//
import SwiftUI
import Foundation

struct OffWithRebecaStage: View {
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var queens: [Queen] = [
        Queen(position: (0,1), diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (2,0), diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (1,3), diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100)))
    ]
    
    var body: some View {
        Stage(chessTable: $chessTable, queens: $queens)
    }
}

#Preview {
    OffWithRebecaStage()
}
