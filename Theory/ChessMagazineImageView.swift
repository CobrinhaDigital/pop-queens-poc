//
//  Untitled.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

struct ChessMagazineImageView: View {
    var body: some View {
        Image(._18632ProblemChessCalviModena1)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 450, maxHeight: 550)
            .padding(.bottom, 100)
    }
}

#Preview {
    ChessMagazineImageView()
}
