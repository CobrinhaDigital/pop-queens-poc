//
//  Mechanics.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 11/02/25.
//
import SwiftUI
import Foundation

struct DivaTutorial {
    var isDivaSelected: Bool = false
    var isDivaOnBoard: Bool = false
    let diva: Diva = Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 130, height: 130), selectedSize: CGSize(width: 150, height: 150))
}

struct MechanicsTutorial: View {
    @State var navigateToNext: Bool = false
    @State var divaTutorial: DivaTutorial = DivaTutorial()
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var queens: [Queen] = []
    
    @State var phase: Int = 0
    @State var text: String = "Tap the diva to select her"
    
    func phaseText() {
        switch phase {
        case 1:
            text = "Now you have selected the diva! Tap the board to place her on it"
        case 2:
            text = "You can remove a diva by taping her again on the board"
        case 3:
            text = "By doing so, she returns to her initial place"
        default:
            print("default")
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                PurpleBlueLinearGradient()
                RoundedRectangle(cornerRadius: 30)
                    .frame(maxWidth: 1050, maxHeight: 700)
                    .foregroundStyle(.white.opacity(0.4))
                if divaTutorial.isDivaOnBoard != false {
                    
                } else {
                    divaTutorial.diva.image
                        .resizable()
                        .position(x: -300, y: 100)
                        .frame(maxWidth: divaTutorial.isDivaSelected ? divaTutorial.diva.selectedSize.width : divaTutorial.diva.defaultSize.width, maxHeight: divaTutorial.isDivaSelected ? divaTutorial.diva.selectedSize.height : divaTutorial.diva.defaultSize.height)
                        .animation(.easeIn, value: divaTutorial.isDivaSelected)
                        .onTapGesture {
                            divaTutorial.isDivaSelected.toggle()
                            phase += 1
                            print(divaTutorial.isDivaSelected)
                            print("diva selecionada", phase)
                        }
                }
                VStack {
                    Text("Let's practice!")
                        .font(.comfortaaBold(size: 34))
                        .padding(.bottom, 5)
                        .fixedSize()
                    Text(text)
                        .font(.comfortaa(size: 24))
                        .padding(.bottom, 25)
                        .fixedSize()
                    Stage(
                        chessTable: $chessTable,
                        queens: $queens
                    ) {
                        divaTutorial.isDivaSelected
                        ? divaTutorial.diva
                        : nil
                    }
                    .fixedSize()
                    .onChange(of: queens) { newValue in
                        let divaIsOnStage = queens.contains { queen in
                            queen.diva == divaTutorial.diva
                        }
                        if divaIsOnStage {
                            divaTutorial.isDivaOnBoard = true
                            divaTutorial.isDivaSelected = false
                            phase += 1
                            print("divaIsOnStage", 1)
                        } else {
                            divaTutorial.isDivaOnBoard = false
                            phase += 1
                        }
                    }
//                    HStack {
//                        
//                        .onAppear {
//                            //demonstracao de como colocar divas em opcoes predeterminadas
//    //                        queens.append(contentsOf: [
//    //                            Queen(
//    //                                position: (line: 1, column: 1),
//    //                                diva: divaTutorial.diva
//    //                            ),
//    //                            Queen(
//    //                                position: (line: 0, column: 1),
//    //                                diva: divaTutorial.diva
//    //                            ),
//    //                            Queen(
//    //                                position: (line: 1, column: 2),
//    //                                diva: divaTutorial.diva
//    //                            )
//    //                        ])
//    ////                        queens.append(
//    ////                            Queen(
//    ////                                position: (line: 1, column: 1),
//    ////                                diva: divaTutorial.diva
//    ////                            )
//    ////                        )
//    //                        queens.forEach { queen in
//    //                            if let index = chessTable.tiles.firstIndex(where: { tile in
//    //                                tile.line == queen.position.line && tile.column == queen.position.column
//    //                            }) {
//    //                                chessTable.tiles[index].image = queen.diva?.image
//    //
//    //                            }
//    //                        }
//                        }
//    //                        if divaTutorial.isDivaSelected != false {
//    //                            withAnimation {
//    //                                let newQueen = Queen(
//    //                                    position: (
//    //                                        line: chessTable.tiles[index].line,
//    //                                        column: chessTable.tiles[index].column
//    //                                    )
//    //                                )
//    //                                newQueen.diva = divaTutorial.diva
//    //                                queens.append(newQueen)
//    //                                chessTable.tiles[index].image = divaTutorial.diva.image
//    //                                divaTutorial.isDivaOnBoard = true
//    //                                divaTutorial.isDivaSelected = false
//    //                            }
//    //                            phase += 1
//    //                        } else {
//    //                            print("passei")
//    //                            let currentPosition = (chessTable.tiles[index].line, chessTable.tiles[index].column)
//    //                            print(currentPosition)
//    //                            queens.forEach { queen in
//    //                                print(queen.position)
//    //                            }
//    //                            if let selectedQueen = queens.first(where: { queen in
//    //                                queen.position == currentPosition
//    //                            }) {
//    //                                removeDivaFromBoard(selectedQueen.diva, at: index)
//    //                            }
//    //                            divaTutorial.isDivaSelected = false
//    //                        }
//    //                    }
//                    }
                }
                Button("", systemImage: "chevron.right") {
                    navigateToNext.toggle()
                }
                .navigationDestination(isPresented: $navigateToNext) {
                    ContentView()
                }
                .foregroundStyle(.black)
                .padding(.leading, 950)
                .padding(.top, 50)
                .font(.title)
            }
        }
        .ignoresSafeArea()
        .scaledToFill()
        .onChange(of: phase) { phase in
            phaseText()
        }
    }
}

#Preview {
    MechanicsTutorial()
}


