//
//  Queen.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 10/02/25.
//
import SwiftUI
import Foundation

//tipo equatable para que eu possa comparar se uma rainha eh igual a outra
class Queen: Equatable {
    var upperLeftDiagonal: [(line: Int, column: Int)] = [] //(-,-)
    var lowerLeftDiagonal: [(line: Int, column: Int)] = [] //(+,-)
    var upperRightDiagonal: [(line: Int, column: Int)] = [] //(+,-)
    var lowerRightDiagonal: [(line: Int, column: Int)] = [] //(+,+)
    let position: (line: Int, column: Int)
    var diva: Diva?
    
    init(position: (line: Int, column: Int), diva: Diva? = nil) {
        self.position = position
        self.diva = diva
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
