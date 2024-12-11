//
//  RulesSheetModel.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 11/12/24.
//
//import SwiftUI
//
//struct Rules: View {
//    @State var isPresented: Bool = false
//    
//    var body : some View {
//        Button("Regras") {
//            isPresented.toggle()
//        }
//        .sheet(isPresented: $isPresented, content: {
//            Text("""
//                - Posicione \(chessTable.rows) rainhas em um tabuleiro \(chessTable.columns)x\(chessTable.rows)
//                - Elas não podem se atacar 
//                - Aperte uma vez para colocar uma rainha
//                - Aperte duas vezes para remover uma rainha
//            """)
//        })
//    }
//}
//
//#Preview {
//    Rules()
//}
