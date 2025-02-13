//
//  Directions.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 12/02/25.
//
import SwiftUI
import Foundation

struct DirectionsTutorial: View {
    @State var chessTable: ChessTableModel = .init(rows: 3, columns: 3)
    var body: some View {
        ZStack {
            PurpleBlueLinearGradient()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            RoundedRectangle(cornerRadius: 30)
                .frame(maxWidth: 1050, maxHeight: 700)
                .foregroundStyle(.white.opacity(0.4))
            VStack {
                Text("")
                HStack(spacing: -250) {
//                    Stage3x3()
//                    Stage3x3()
//                    Stage3x3()
                }
            }
        }
    }
}

#Preview {
    DirectionsTutorial()
}

