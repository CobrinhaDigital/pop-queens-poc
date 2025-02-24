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
    @State var queens01: [Queen] = [
        Queen(position: (0,1), diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (1,3), diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (2,0), diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (3,2), diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100)))
    ]
    @State var queens02: [Queen] = [
        Queen(position: (0,2), diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (1,0), diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (2,3), diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (3,1), diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100)))
    ]
    
    var body: some View {
        HStack(spacing: -250) {
            VStack {
                Stage(chessTable: $chessTable01, queens: $queens01)
                SubtitleTextBlock(text: "Fundamental solution", outerWidth: 260, innerWidth: 255)
                    .padding(.top, 10)
            }
            VStack {
                Stage(chessTable: $chessTable02, queens: $queens02)
                SubtitleTextBlock(text: "Mirroed solution", outerWidth: 260, innerWidth: 255)
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    Solutions()
}
