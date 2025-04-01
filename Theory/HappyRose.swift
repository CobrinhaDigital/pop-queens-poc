//
//  HappyRose.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 23/02/25.
//
import SwiftUI
import Foundation

struct HappyRose: View {
    var body: some View {
        ZStack {
            Image(.roseCorpoOficial)
                .resizable()
                .padding(.bottom, 80)
                .frame(maxWidth: 200, maxHeight: 600)
            Image(.balloon)
                .resizable()
                .position(x: 350, y: -200)
                .frame(maxWidth: 230, maxHeight: 180)
                .overlay(
                    Text("Maybe we can talk about it after the show?")
                        .multilineTextAlignment(.center)
                        .position(x: 333, y: -225)
                        .font(.comfortaa(size: 17))
                        .padding(.horizontal, 30)
                )
        }
        .padding(.top, 50)
    }
}

#Preview {
    HappyRose()
}
