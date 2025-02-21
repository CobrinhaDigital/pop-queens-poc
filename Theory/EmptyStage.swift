//
//  EmptyStage.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 21/02/25.
//
import SwiftUI
import Foundation

struct EmptyStage: View {
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var queens: [Queen] = []
    
    var body: some View {
        Stage(chessTable: $chessTable, queens: $queens)
    }
}

#Preview {
    EmptyStage()
}
