//
//  OutOfStates.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 19/02/25.
//
import SwiftUI
import Foundation

struct DivaExample {
    var isDivaSelected: Bool = false
    var isDivaOnBoard: Bool = false
    let diva: Diva = Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 110, height: 150), selectedSize: CGSize(width: 130, height: 180))
}

struct OutOfStates: View {
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var divaExample: DivaExample = DivaExample()
    @State var queens: [Queen] = [
        Queen(position: (1, 3), diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (2, 1), diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (3, 2), diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100)))
    ]
    
    var body: some View {
        ZStack {
            Stage(chessTable: $chessTable, queens: $queens) {
                return divaExample.isDivaSelected ? divaExample.diva : nil
            }
            .onChange(of: queens) { newValue in
                let divaIsOnStage = queens.contains() { queen in
                    queen.diva == divaExample.diva
                }
                if divaIsOnStage {
                    divaExample.isDivaOnBoard = true
                    divaExample.isDivaSelected = false 
                } else {
                    divaExample.isDivaOnBoard = false
                }
            }
            if divaExample.isDivaSelected != true && divaExample.isDivaOnBoard == false {
                Image(.balloon)
                    .resizable()
                    .frame(maxWidth: 150, maxHeight: 110)
                    .position(x: 1050, y: 400)
                    .scaleEffect(x: -1)
                    .overlay(
                        Text("Hey, tap me!")
                            .font(.comfortaaBold(size: 17))
                            .foregroundStyle(.black)
                            .position(x: 155, y: 380)
                    )
            }
            if divaExample.isDivaOnBoard == false {
                divaExample.diva.image
                    .resizable()
                    .onTapGesture {
                        divaExample.isDivaSelected.toggle()
                        print("Selecuonada ? ", divaExample.isDivaSelected)
                    }
                    .frame(maxWidth: divaExample.isDivaSelected ? divaExample.diva.selectedSize.width : divaExample.diva.defaultSize.width, maxHeight: divaExample.isDivaSelected ? divaExample.diva.selectedSize.height : divaExample.diva.defaultSize.height)
                    .animation(.easeInOut, value: divaExample.isDivaSelected)
                    .position(x: 300, y: 500)
            }
        }
    }
}

#Preview {
    OutOfStates()
}
