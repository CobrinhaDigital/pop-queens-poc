import UIKit
import SwiftUI
import AVFoundation

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}

//aqui seria ChessTable
struct ContentView: View {
    @State var chessTable: ChessTableModel = .init(rows: 4, columns: 4)
    @State var coordsX: [(line: Int, column: Int)] = []
    @State var colisions: [(line: Int, column: Int)] = []
    @State var tapCount: Int = 0
    @State var isTipsPresented: Bool = false
    @State var isRulesPresented: Bool = false
    @State var isSolved: Bool = false
    @State var tapToPlace = 0
    @State var queens: [Queen] = []
    @State var resultSubmit = ""
    @State var selectedImage: Image?
    @State var selectedDiva: Diva?
    @State var tapCountDiva: Int = 0
    @State var tapCountDivaOnBoard: [Diva.ID : Int] = [:]
    @State var placedDivas: Set<String> = []
    @State var giveUpAlert: Bool = false
    @State var navigateToNext: Bool = false

    let divas: [Diva] = .init([
        Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 95, height: 93), selectedSize: CGSize(width: 110, height: 105)),
        Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 108, height: 100), selectedSize: CGSize(width: 118, height: 110)),
        Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 80, height: 105), selectedSize: CGSize(width: 95, height: 115)),
        Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 80, height: 110), selectedSize: CGSize(width: 95, height: 125))
    ])
    
    func hasCollision(_ index: Int) -> Bool {
        colisions.contains(where: { colision in
            colision.line == chessTable.tiles[index].line && colision.column == chessTable.tiles[index].column
        })
    }
    
    func checkColisionLineColumn() -> Bool {
        var result: Bool = false
        
        for i in coordsX {
            if let sameColumn = coordsX.first(where: { position in
                position.column == i.column && position != i
            }) {
                print("Conflito coluna", sameColumn)
                colisions.append(sameColumn)
                result = true
                return result
            }
             
            if let sameRow = coordsX.first(where: { position in
                position.line == i.line && position != i
            }) {
                print("Conflito linha", sameRow)
                colisions.append(sameRow)
                result = true
                return result
            }
        }
        
        return result
    }
    
    //funcao a ser refatorada, for em for eh sus
    func checkColisionDiagonals() -> Bool {
        var result = false
        for queen in queens {
            for queenTest in queens {
                if queenTest != queen && queen.containQueenInDiagonal(queen: queenTest) {
                    colisions.append(queenTest.position)
                    result = true
                    break
                }
            }
        }
        return result
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color(.rosa), .purple, Color(.azul), .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                VStack {
                    HStack {
                        ForEach(divas) { diva in
                            if !placedDivas.contains(diva.name) {
                                diva.image
                                    .resizable()
                                    .contentShape(.rect)
                                    .onTapGesture {
                                        if tapCountDiva % 2 == 0 {
                                            selectedDiva = diva
                                            selectedImage = diva.image
    //                                        print("selectedDiva: ", selectedDiva!.name, "selectedImage: ", selectedImage!)
                                        } else {
                                            selectedDiva = nil
                                            selectedImage = nil
    //                                        print("selectedDiva: ", selectedDiva!.name, "selectedImage: ", selectedImage!)
                                        }
                                        tapCountDiva += 1
                                        print("tapCountDiva: ", tapCountDiva)
                                    }
                                    .frame(maxWidth: (selectedDiva == diva) ? diva.selectedSize.width : diva.defaultSize.width, maxHeight: (selectedDiva == diva) ?  diva.selectedSize.height : diva.defaultSize.height)
                                    .animation(.easeInOut, value: selectedDiva)
                                    .padding(.leading, diva.name == "rachel" ? 5 : 0)
                            }
                        }
                    }
                    .fixedSize()
                    if resultSubmit != "" {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(maxWidth: 315, maxHeight: 45)
                            RoundedRectangle(cornerRadius: 6)
                                .frame(maxWidth: 310, maxHeight: 40)
                                .foregroundStyle(.white)
                            Text(resultSubmit)
                                .font(.comfortaaBold(size: 17))
                                
//                                .foregroundStyle(Color.black)
                        }
                        .foregroundStyle(isSolved ? .green : .red)
                        .transition(isSolved ? .scale : .slide)
                        .padding(.vertical, 2.5)
                    }
                    LazyVGrid(columns: Array(repeating: GridItem(.fixed(130), spacing: 0), count: chessTable.columns), spacing: 0) {
                        ForEach(chessTable.tiles.indices, id: \.self) { index in
                            Rectangle()
                                .border(.black, width: 1)
                                .aspectRatio(1, contentMode: .fill)
                                .foregroundStyle((chessTable.tiles[index].line + chessTable.tiles[index].column) % 2 == 0 ? RadialGradient(colors: [.white, .purple], center: .center, startRadius: 5, endRadius: 90) : RadialGradient(colors: [Color(.verdeCiano), .mint], center: .center, startRadius: 10, endRadius: 90))
                                .overlay {
    //                                if let mark = chessTable.tiles[index].image {
    //
    //                                }
                                    chessTable.tiles[index].image.map { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.all, 5)
                                    }
                                }
                                .border(hasCollision(index) ? .red : .clear, width: 5)
                                .onTapGesture {
//                                    print("Tap")
                                    
                                    UIDevice.vibrate()
                                    if selectedDiva != nil {
//                                        if placedDivas.contains(selectedDiva?.name) {
//                                            
//                                        }
                                        // adicionar uma segunda diva depois de remover outra na mesma posicao
                                        if let existentIndex = queens.firstIndex(where: {
                                            chessTable.tiles[index].line == $0.position.line && chessTable.tiles[index].column == $0.position.column
                                        }) {
                                            chessTable.tiles[index].image = nil
                                            print("Antes de remover: ", queens)
                                            queens.remove(at: existentIndex)
                                            print("Depois de remover: ", queens)
                                            coordsX.remove(at: existentIndex)
                                            
                                            tapToPlace -= 1 //decrementava antes
                                            print("decremento no else: ", tapCount)
                                            placedDivas.remove(selectedDiva?.name ?? "")
                                            print("placedDivas if: ", placedDivas)
                                            print("tapToPlace if: ",tapToPlace)
                                            print("Printando placedDivas em if: ", placedDivas)
        //                                    print("antes do nil em selectedDiva", selectedDiva!.name)
                                            
        //                                    print("depois do nil em selectedDiva", selectedDiva!.name)
                                        }
                                        //else adiciona uma diva ao tabuleiro
                                        else {
                                            if tapToPlace <= chessTable.columns - 1 && !placedDivas.contains(selectedDiva?.name ?? "") {
                                                let newQueen = Queen(
                                                    position: (
                                                        line: chessTable.tiles[index].line,
                                                        column: chessTable.tiles[index].column
                                                    )
                                                )
                                                newQueen.diva = selectedDiva
                                                chessTable.tiles[index].image = selectedImage
        //                                        chessTable.tiles[index].string = "♛"
                                                coordsX.append((chessTable.tiles[index].line, chessTable.tiles[index].column))
                                                queens.append(newQueen)
                                                placedDivas.insert(selectedDiva?.name ?? "")
                                                tapToPlace += 1
                                                tapCountDiva -= 1
                                                selectedImage = nil
        //                                        print("antes do nil em selectedDiva", selectedDiva!)
                                                selectedDiva = nil
        //                                        print("depois do nil em selectedDiva", selectedDiva!)
        //                                        selectedDiva?.image = nil
                                                print("placedDivas else: ", placedDivas)
        //                                        print(coordsX)
                                                print("tapToPlace else: ",tapToPlace)
                                            }
                                    }
                                        Task {
                                            let queen = queens[queens.count - 1]
                                            
                                            //esquerda superior
                                            var upperLeftNextX = chessTable.tiles[index].line - 1
                                            var upperLeftNextY = chessTable.tiles[index].column - 1
                                            while (
                                                upperLeftNextX >= 0 && upperLeftNextY >= 0
                                            ) {
                                                queen.upperLeftDiagonal.append((upperLeftNextX, upperLeftNextY))
                                                upperLeftNextX -= 1
                                                upperLeftNextY -= 1
                                            }
                                            
                                            //direita superior
                                            var upperRightNextX = chessTable.tiles[index].line - 1
                                            var upperRightNextY = chessTable.tiles[index].column + 1
                                            while (
                                                upperRightNextX >= 0 && upperRightNextY < chessTable.columns
                                            ) {
                                                queen.upperRightDiagonal.append((upperRightNextX, upperRightNextY))
                                                upperRightNextX -= 1
                                                upperRightNextY += 1
                                            }
                                            
                                            //esquerda inferior
                                            var lowerLeftNextX = chessTable.tiles[index].line + 1
                                            var lowerLeftNextY = chessTable.tiles[index].column - 1
                                            while (
                                                lowerLeftNextX < chessTable.rows && lowerLeftNextY >= 0
                                            ) {
                                                queen.lowerLeftDiagonal.append((lowerLeftNextX, lowerLeftNextY))
                                                lowerLeftNextX += 1
                                                lowerLeftNextY -= 1
                                            }
                                            
                                            //direita inferior
                                            var lowerRightNextX = chessTable.tiles[index].line + 1
                                            var lowerRightNextY = chessTable.tiles[index].column + 1
                                            while (
                                                lowerRightNextX < chessTable.columns && lowerRightNextY < chessTable.rows
                                            ) {
                                                queen.lowerRightDiagonal.append((lowerRightNextX, lowerRightNextY))
                                                lowerRightNextX += 1
                                                lowerRightNextY += 1
                                            }
                                        }
                                    }
                                    
                                    else {
                                        let currentPosition = (chessTable.tiles[index].line, chessTable.tiles[index].column)
                                        tapToPlace -= 1
                                        if let selectedQueen = queens.first(where: { queen in
                                            queen.position == currentPosition
                                        }) {
                                            removeDivaFromBoard(selectedQueen.diva, at: index)
                                        }
                                    }
                                }
                        }
                        .accessibilityLabel("Tabuleiro de xadrez \(chessTable.rows)x\(chessTable.columns)")
                    }
                    .shadow(radius: 2.5)
                    .fixedSize()
                    .padding()
                    .onAppear() {
                        chessTable.createTiles()
                    }
                    HStack(spacing: 10) {
                        Button("Give up?") {
                            giveUpAlert.toggle()
                        }
                        .font(.comfortaaBold(size: 20))
                        .frame(width: 150, height: 50)
                        .background(Color.red.opacity(0.8))
                        .clipShape(.capsule)
                        .shadow(radius: 2.5)
                        .tint(.white)
                        .alert("Are you sure?", isPresented: $giveUpAlert) {
                            Button("Yes") {
                                navigateToNext.toggle()
                            }
                            .navigationDestination(isPresented: $navigateToNext) {
                                h1()
                            }
                            Button("No", role: .cancel) {
                                
                            }
                        }
                        Button("Clean") {
                            UIDevice.vibrate()
                            coordsX.removeAll()
                            queens.removeAll()
                            colisions.removeAll()
                            resultSubmit = ""
                            tapCount = 0
                            tapToPlace = 0
                            selectedImage = nil
                            placedDivas.removeAll()
                            for index in chessTable.tiles.indices {
                                chessTable.tiles[index].image = nil
                            }
                        }
    //                    .shadow(radius: 50)
                        .frame(width: 150, height: 50)
                        .background(Color.blue.opacity(0.8))
                        .clipShape(.capsule)
                        .tint(.white)
                        .shadow(radius: 2.5)
                        .bold()
                        .font(.comfortaaBold(size: 20))
                        if tapToPlace >= chessTable.rows {
                            Button("Submit") {
                                UIDevice.vibrate()
                                let resultLineColumn = checkColisionLineColumn()
                                let resultDiagonal = checkColisionDiagonals()
                                print(resultDiagonal, resultLineColumn)
                                
                                withAnimation {
                                    if resultLineColumn == true || resultDiagonal == true {
                                        isSolved = false
                                        return resultSubmit = "Oops, that's not quite right... 😕"
                                    }
                                    if resultDiagonal == false || resultLineColumn == false {
                                        isSolved = true
                                        return resultSubmit = "Congrats, you solved it! 🥳"
                                    }
                                }
                            }
                            .disabled(tapCount == 7 ? true : false)
                            .frame(width: 150, height: 50)
                            .background(Color.green.opacity(0.8))
                            .clipShape(.capsule)
                            .shadow(radius: 2.5)
                            .font(.comfortaaBold(size: 20))
                            .tint(.white)
                            .bold()
                        }
                    }
                    .padding(.top, 1.5)
                }
            }
            .ignoresSafeArea()
            .scaledToFill()
            .previewInterfaceOrientation(.landscapeRight)
        }
        .ignoresSafeArea()
        .scaledToFill()
        .navigationBarBackButtonHidden(true)
        .previewInterfaceOrientation(.landscapeRight)
    }
    
    private func removeDivaFromBoard(_ diva: Diva?, at index: Int) {
        guard let diva = diva else { return }
        chessTable.tiles[index].image = nil
        placedDivas.remove(diva.name)
        queens.removeAll(where: {$0.diva == diva})
        print(placedDivas)
    }
}

#Preview {
    ContentView()
}
