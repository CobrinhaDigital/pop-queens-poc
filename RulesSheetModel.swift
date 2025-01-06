
//  RulesSheetModel.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 11/12/24.

import SwiftUI

//            HStack(spacing: 25) {
//                Button("Dicas") {
//                    isTipsPresented.toggle()
//                }
//                .bold()
//                .font(.title2)
//                .tint(.white)
//                .clipShape(.capsule)
//                .frame(width: 150, height: 50)
//                .background(Color.orange.opacity(0.8).clipShape(.capsule))
//                .sheet(isPresented: $isTipsPresented, content: {
//                    Text("Dicas")
//                        .font(.largeTitle)
//                        .padding()
//                        .bold()
//                    VStack {
//                        Text("- As rainhas não podem ficar nem na mesma coluna nem na mesma linha")
//                            .padding(.bottom, 10)
//                        Text("- O número de linhas e de colunas é igual ao número de rainhas")
//                            .padding(.bottom, 10)
//                    }
//                    .padding(.horizontal)
//                })
//                Button("Regras") {
//                    isRulesPresented.toggle()
//                }
//                .bold()
//                .font(.title2)
//                .tint(.white)
//                .frame(width: 150, height: 50)
//                .background(Color.green.opacity(0.9).clipShape(.capsule))
//                .sheet(isPresented: $isRulesPresented, content: {
//                    Text("Regras")
//                        .bold()
//                        .font(.largeTitle)
//                    Image("queen_positions")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(maxWidth: 300, maxHeight: 300)
//                        .padding(.bottom, 20)
//                        .accessibilityLabel("Imagem que mostra as direções que uma rainha pode percorrer, que são vertical, horizontal e diagonal.")
//                    VStack {
//                        Text("""
//                            - Posicione \(chessTable.rows) rainhas em um tabuleiro \(chessTable.columns)x\(chessTable.rows)
//
//                            - Elas não podem se atacar
//
//                            - Aperte uma vez para colocar uma rainha
//
//                            - Aperte duas vezes para remover uma rainha
//                        """)
//                    }
//                })
//            }
//            .padding()
