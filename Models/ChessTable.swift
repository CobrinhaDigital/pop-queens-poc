//
//  ChessTable.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 10/02/25.
//
import SwiftUI
import Foundation

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
