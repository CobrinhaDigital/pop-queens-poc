//
//  OutOfStates.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 19/02/25.
//
import SwiftUI
import Foundation

//struct DivaExample {
//    var isDivaSelected: Bool = false
//    var isDivaOnBoard: Bool = false
//    let diva: Diva = Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 110, height: 150), selectedSize: CGSize(width: 130, height: 180))
//}

struct OutOfStates: View {
    @Binding var divaPosition: (Int, Int)?
    @State var isDivaSelected: Bool = false
    @State var isDivaOnBoard: Bool = false
    @State var diva: Queen = Queen(position: (0, 0), diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 110, height: 150), selectedSize: CGSize(width: 130, height: 180)))
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
//    @State var divaExample: DivaExample = DivaExample()
    @State var queens: [Queen] = [
        Queen(position: (1, 3), diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (2, 1), diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))),
        Queen(position: (3, 2), diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100)))
    ]
    
    var body: some View {
        ZStack {
            Stage(chessTable: $chessTable, queens: $queens) {
                return isDivaSelected ? diva.diva : nil
            }
            .onChange(of: queens) { newValue in
                let divaIsOnStage = queens.contains() { queen in
                    queen.diva == diva.diva
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
            if isDivaOnBoard == false {
                diva.diva?.image
                    .resizable()
                    .onTapGesture {
                        isDivaSelected.toggle()
                        print("Selecuonada ? ", isDivaSelected)
                    }
                    .frame(maxWidth: isDivaSelected ? diva.diva?.selectedSize.width : diva.diva?.defaultSize.width, maxHeight: isDivaSelected ? diva.diva?.selectedSize.height : diva.diva?.defaultSize.height)
                    .animation(.easeInOut, value: isDivaSelected)
                    .position(x: 300, y: 500)
            }
        }
    }
}

#Preview {
    OutOfStates(divaPosition: .constant((0,0)))
}
