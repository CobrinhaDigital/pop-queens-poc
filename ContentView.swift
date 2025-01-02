import UIKit
import SwiftUI
import AVFoundation

struct ChessTileModel {
    let line: Int
    let column: Int
    var string: String?
}

//tipo equatable para que eu possa comparar se uma rainha eh igual a outra
class Queen: Equatable {
    var upperLeftDiagonal: [(line: Int, column: Int)] = [] //(-,-)
    var lowerLeftDiagonal: [(line: Int, column: Int)] = [] //(+,-)
    var upperRightDiagonal: [(line: Int, column: Int)] = [] //(+,-)
    var lowerRightDiagonal: [(line: Int, column: Int)] = [] //(+,+)
    let position: (line: Int, column: Int)
    
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
        VStack {
            Text("Desafio das \(chessTable.rows) rainhas")
                .font(.largeTitle)
                .bold()
            if resultSubmit != "" {
                Text("\(resultSubmit)")
                .font(.title3)
                .foregroundStyle(isSolved ? .green : .red)
//                .animation(isSolved ? .bouncy : .easeIn, value: isSolved)
                .transition(isSolved ? .scale : .slide)
                .padding(.vertical, 2.5)
                .bold()
            }
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(50), spacing: 0), count: chessTable.columns), spacing: 0) {
                ForEach(chessTable.tiles.indices, id: \.self) { index in
                    Rectangle()
                        .border(.black, width: 1)
                        .aspectRatio(1, contentMode: .fill)
                        .foregroundStyle((chessTable.tiles[index].line + chessTable.tiles[index].column) % 2 == 0 ? .purple : .mint)
                        .overlay {
                            if let mark = chessTable.tiles[index].string {
                                Text(mark)
                                    .foregroundStyle(.black)
                                    .font(.system(size: 50))
                                    .bold()
                            }
                        }
                        .border(hasCollision(index) ? .red : .clear, width: 5)
                        .onTapGesture {
                            UIDevice.vibrate()
                            if let existentIndex = queens.firstIndex(where: {chessTable.tiles[index].line == $0.position.line && chessTable.tiles[index].column == $0.position.column} ){
                                chessTable.tiles[index].string = ""
                                queens.remove(at: existentIndex)
                                coordsX.remove(at: existentIndex)
                                tapToPlace -= 1
                            } else {
                                if tapToPlace <= chessTable.columns - 1 {
                                    let newQueen = Queen(
                                        position: (
                                            line: chessTable.tiles[index].line,
                                            column: chessTable.tiles[index].column
                                        )
                                    )
                                    chessTable.tiles[index].string = "♛"
                                    coordsX.append((chessTable.tiles[index].line, chessTable.tiles[index].column))
                                    queens.append(newQueen)
                                    tapToPlace += 1
                                    print(coordsX)
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
                        }
                }
                .accessibilityLabel("Tabuleiro de xadrez \(chessTable.rows)x\(chessTable.columns)")
            }
            .padding()
            .onAppear() {
                chessTable.createTiles()
            }
            HStack(spacing: 25) {
                Button("Dicas") {
                    isTipsPresented.toggle()
                }
                .bold()
                .font(.title2)
                .tint(.white)
                .clipShape(.capsule)
                .frame(width: 150, height: 50)
                .background(Color.orange.opacity(0.8).clipShape(.capsule))
                .sheet(isPresented: $isTipsPresented, content: {
                    Text("Dicas")
                        .font(.largeTitle)
                        .padding()
                        .bold()
                    VStack {
                        Text("- As rainhas não podem ficar nem na mesma coluna nem na mesma linha")
                            .padding(.bottom, 10)
                        Text("- O número de linhas e de colunas é igual ao número de rainhas")
                            .padding(.bottom, 10)
                    }
                    .padding(.horizontal)
                })
                Button("Regras") {
                    isRulesPresented.toggle()
                }
                .bold()
                .font(.title2)
                .tint(.white)
                .frame(width: 150, height: 50)
                .background(Color.green.opacity(0.9).clipShape(.capsule))
                .sheet(isPresented: $isRulesPresented, content: {
                    Text("Regras")
                        .bold()
                        .font(.largeTitle)
                    Image("queen_positions")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 300)
                        .padding(.bottom, 20)
                        .accessibilityLabel("Imagem que mostra as direções que uma rainha pode percorrer, que são vertical, horizontal e diagonal.")
                    VStack {
                        Text("""
                            - Posicione \(chessTable.rows) rainhas em um tabuleiro \(chessTable.columns)x\(chessTable.rows)
                        
                            - Elas não podem se atacar 
                        
                            - Aperte uma vez para colocar uma rainha
                        
                            - Aperte duas vezes para remover uma rainha
                        """)
                    }
                })
            }
            .padding()
            HStack(spacing: 25) {
                Button("Limpar") {
                    UIDevice.vibrate()
                    coordsX.removeAll()
                    queens.removeAll()
                    colisions.removeAll()
                    resultSubmit = ""
                    tapCount = 0
                    tapToPlace = 0
                    for index in chessTable.tiles.indices {
                        chessTable.tiles[index].string = ""
                    }
                }
                .frame(width: 150, height: 50)
                .background(Color.red.opacity(0.8))
                .clipShape(.capsule)
                .tint(.white)
                .bold()
                .font(.title2)
                if tapToPlace == chessTable.rows {
                    Button("Enviar") {
                        UIDevice.vibrate()
                        let resultLineColumn = checkColisionLineColumn()
                        let resultDiagonal = checkColisionDiagonals()
                        print(resultDiagonal, resultLineColumn)
                        
                        withAnimation {
                            if resultLineColumn == true || resultDiagonal == true {
                                isSolved = false
                                return resultSubmit = "Opa, não é bem por aí... 😕"
                            }
                            if resultDiagonal == false || resultLineColumn == false {
                                isSolved = true
                                return resultSubmit = "Parabéns, você resolveu o desafio! 🥳"
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
}
