import UIKit
import SwiftUI
import AVFoundation

struct ChessTileModel {
    let line: Int
    let column: Int
    var image: Image?
}

struct Diva: Equatable, Identifiable {
    let id = UUID()
    let name: String
    var image: Image
    let defaultSize: CGSize
    let selectedSize: CGSize
}

//tipo equatable para que eu possa comparar se uma rainha eh igual a outra
class Queen: Equatable {
    var upperLeftDiagonal: [(line: Int, column: Int)] = [] //(-,-)
    var lowerLeftDiagonal: [(line: Int, column: Int)] = [] //(+,-)
    var upperRightDiagonal: [(line: Int, column: Int)] = [] //(+,-)
    var lowerRightDiagonal: [(line: Int, column: Int)] = [] //(+,+)
    let position: (line: Int, column: Int)
    var diva: Diva?
    
    init(position: (line: Int, column: Int)) {
        self.position = position
    }
    
    //aqui eu verifico se existe uma rainha na diagonal sendo analisada
    func containQueenInDiagonal(queen: Queen) -> Bool {
        let result: Bool = false //começo com falso pq nao sei se existe ou nao ainda
        
        //percorro a diagonal comparada e verifico se existe uma rainha que esta posicionada la
        let diagonals = [upperLeftDiagonal, lowerLeftDiagonal, upperRightDiagonal, lowerRightDiagonal]
        
        for diagonal in diagonals {
            if diagonal.contains(where: { $0 == queen.position }) {
                return true
            }
        }
        //por fim retorno o resultado
        //falso caso nao tenha rainha na diagonal analisada
        //verdadeiro caso tenha
        return result
    }
    
    static func == (lhs: Queen, rhs: Queen) -> Bool {
        lhs.position == rhs.position
    }
}


struct ChessTableModel {
    let rows: Int
    let columns: Int
    
    var tiles: [ChessTileModel] = []
    
    mutating func createTiles() {
        for i in 0..<rows {
            for j in 0..<columns {
                tiles.append(ChessTileModel(line: i, column: j))
            }
        }
    }
}

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
                                    .shadow(radius: 5)
                                    .padding(.leading, diva.name == "rachel" ? 5 : 0)
                            }
                        }
                    }
                    .fixedSize()
                    if resultSubmit != "" {
                        Text("\(resultSubmit)")
                        .font(.title3)
                        .foregroundStyle(isSolved ? .green : .red)
                        .transition(isSolved ? .scale : .slide)
                        .padding(.vertical, 2.5)
                        .bold()
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
                                    //codigo abaixo feito pelo chatgpt, ele tem mania de usar map
                                    //iteracao desnecessaria
                                    //aplicar overlay apenas no tile clicado, atribuindo a imagem correspondente
                                    chessTable.tiles[index].image.map { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.all, 5)
                                    }
                                }
                                .border(hasCollision(index) ? .red : .clear, width: 5)
                                .onTapGesture {
                                    print("Tap")
                                    
                                    UIDevice.vibrate()
                                    if selectedDiva != nil {
//                                        if placedDivas.contains(selectedDiva?.name) {
//                                            
//                                        }
                                        if let existentIndex = queens.firstIndex(where: {chessTable.tiles[index].line == $0.position.line && chessTable.tiles[index].column == $0.position.column}) {
                                            chessTable.tiles[index].image = nil
                                            queens.remove(at: existentIndex)
                                            coordsX.remove(at: existentIndex)
                                            tapToPlace -= 1
                                            placedDivas.remove(selectedDiva?.name ?? "")
                                            print("placedDivas if: ", placedDivas)
                                            print("tapToPlace if: ",tapToPlace)
                                            print(placedDivas)
        //                                    print("antes do nil em selectedDiva", selectedDiva!.name)
                                            
        //                                    print("depois do nil em selectedDiva", selectedDiva!.name)
                                        } else {
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
                    HStack(spacing: 25) {
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
                        .background(Color.red.opacity(0.8))
                        .clipShape(.capsule)
                        .tint(.white)
                        .bold()
                        .font(.title2)
                        if tapToPlace == chessTable.rows {
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
                            .background(Color.blue.opacity(0.8))
                            .clipShape(.capsule)
                            .font(.title2)
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
        print(placedDivas)
//        if placedDivas.contains(diva.name){
//            print("A diva ta no tabuleiro")
//        }
    }
}

#Preview {
    ContentView()
}
