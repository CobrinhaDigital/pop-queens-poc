//
//  AvailableSpaces.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 21/02/25.
//
import SwiftUI
import Foundation

struct AvailableSpaces: View {
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var check: [Queen] = []
    
    var body: some View {
        ZStack {
            Stage(chessTable: $chessTable, queens: $check)
            Text("✅")
                .font(.largeTitle)
                .padding(.top, 430)
                .position(x: 560, y: 265)
            Text("✅")
                .font(.largeTitle)
                .padding(.top, 430)
                .position(x: 733, y: 348)
            Text("✅")
                .font(.largeTitle)
                .padding(.top, 430)
                .position(x: 475, y: 435)
            Text("✅")
                .font(.largeTitle)
                .padding(.top, 430)
                .position(x: 648, y: 523)
        }
    }
}

#Preview {
    AvailableSpaces()
}
