//
//  BacktrackingWorstCase.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 19/02/25.
//
import SwiftUI
import Foundation

struct BacktrackingWorstCase: View {
    @State var chessTableCorner: ChessTableModel = .init(rows: 4, columns: 4)
    @State var chessTableCenter: ChessTableModel = .init(rows: 4, columns: 4)
    @State var queensWorstCaseCorner: [Queen] = [
        Queen(
            position: (0,0),
            diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen(
            position: (0,3),
            diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen(
            position: (3,0),
            diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen(
            position: (3,3),
            diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        )
    ]
    @State var queensWorstCaseCenter: [Queen] = [
        Queen(
            position: (1,1),
            diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen(
            position: (1,2),
            diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen(
            position: (2,1),
            diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen(
            position: (2,2),
            diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        )
    ]
    
    var body: some View {
        HStack(spacing: -300) {
            VStack(spacing: 20) {
                Stage(chessTable: $chessTableCorner, queens: $queensWorstCaseCorner)
                SubtitleTextBlock(
                    text: "All divas are on each other's way",
                    outerWidth: 320, innerWidth: 315
                )
            }
            VStack(spacing: 20) {
                Stage(chessTable: $chessTableCenter, queens: $queensWorstCaseCenter)
                SubtitleTextBlock(
                    text: "Same situation here",
                    outerWidth: 320, innerWidth: 315
                )
            }
        }
    }
}

#Preview {
    BacktrackingWorstCase()
}
