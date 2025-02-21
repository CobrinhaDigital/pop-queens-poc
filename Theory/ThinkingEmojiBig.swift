//
//  ThinkingEmojiBig.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 21/02/25.
//
import SwiftUI
import Foundation

struct ThinkingEmojiBig: View {
    var body: some View {
        Text("🤔")
            .font(.system(size: 300))
            .shadow(radius: 10)
        //fazer animcacao com isso? preciso pensar 🤔
            .rotation3DEffect(.degrees(0), axis: (x: 0, y: 0, z: 1))
    }
}

#Preview {
    ThinkingEmojiBig()
}
