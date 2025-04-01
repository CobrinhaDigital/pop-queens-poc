//
//  Backtracking.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 22/02/25.
//
import SwiftUI
import Foundation

struct Backtracking: View {
    var body: some View {
        VStack(spacing: 60) {
            Text("✨ Backtracking ✨")
                .font(.comfortaaBold(size: 70))
                .foregroundStyle(.white)
                .shadow(radius: 2.5)
            ThreeOutOfFour()
                .padding(.bottom, 100)
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        Backtracking()
    }
}
