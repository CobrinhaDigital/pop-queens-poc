//
//  Solutions.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 21/02/25.
//
import SwiftUI
import Foundation

struct Solutions: View {
    @State var chessTable01: ChessTableModel = .init(rows: 4, columns: 4)
    @State var chessTable02: ChessTableModel = .init(rows: 4, columns: 4)
    @State var queens01: [Queen] = []
    @State var queens02: [Queen] = []
    
    var body: some View {
        HStack {
            VStack {
                Stage(chessTable: $chessTable01, queens: $queens01)
                SubtitleTextBlock(text: "rusbad")
            }
            VStack {
                Stage(chessTable: $chessTable02, queens: $queens02)
                SubtitleTextBlock(text: "rusbad")
            }
        }
    }
}

#Preview {
    Solutions()
}
