//
//  RebecaInteractiveBoard.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 19/02/25.
//
import SwiftUI
import Foundation

struct DivaInteractiveExample {
    
}

struct RebecaInteractiveBoard: View {
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var isDivaOnBoard: Bool = false
    @State var isDivaSelected: Bool = false
    @State var diva: Diva = Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 140, height: 150), selectedSize: CGSize(width: 160, height: 170))
    @State var queens: [Queen] = [
        Queen(position: (1, 3), diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (2, 0), diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (0, 1), diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100)))
    ]
    
    var body: some View {
        ZStack {
            Stage(chessTable: $chessTable, queens: $queens) {
                return isDivaSelected ? diva : nil
            }
            .onChange(of: queens) { newValue in
                let divaIsOnStage = queens.contains() { queen in
                    queen.diva == diva
                }
                if divaIsOnStage {
                    isDivaOnBoard = true
                    isDivaSelected = false
                } else {
                    isDivaOnBoard = false
                }
            }
            if isDivaSelected != true && isDivaOnBoard == false {
                Image(.balloon)
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 120)
                    .position(x: 1075, y: 300)
                    .scaleEffect(x: -1)
                    .overlay(
                        Text("""
                                You can tap me, 
                                you know?
                        """)
                            .multilineTextAlignment(.center)
                            .font(.comfortaaBold(size: 17))
                            .foregroundStyle(.black)
                            .position(x: 110, y: 280)
                    )
            }
            if isDivaOnBoard == false {
               diva.image
                    .resizable()
                    .onTapGesture {
                        isDivaSelected.toggle()
                    }
                    .frame(maxWidth: isDivaSelected ? diva.selectedSize.width : diva.defaultSize.width, maxHeight: isDivaSelected ? diva.selectedSize.height : diva.defaultSize.height)
                    .animation(.easeInOut, value: isDivaSelected)
                    .position(x: 300, y: 400)
            }
        }
    }
}

#Preview {
    RebecaInteractiveBoard()
}
