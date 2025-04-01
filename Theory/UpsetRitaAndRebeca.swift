//
//  UpsetRitaAndRebeca.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 23/02/25.
//
import SwiftUI
import Foundation

struct UpsetRitaAndRebeca: View {
    var body: some View {
        ZStack {
            HStack {
                Image(.ritaCorpoOficial)
                    .resizable()
                    .frame(maxWidth: 230, maxHeight: 500)
                Image(.rebecaCorpoOficial)
                    .resizable()
                    .frame(maxWidth: 240, maxHeight: 500)
            }
            HStack(spacing: 550) {
                Image(.balloon)
                    .resizable()
                    .scaleEffect(x: -1)
                    .frame(maxWidth: 230, maxHeight: 180)
                    .overlay(
                        Text("Bestie, I need to stop you right there.")
                            .multilineTextAlignment(.center)
                            .font(.comfortaaBold(size: 17))
                            .padding(.horizontal, 30)
                            .position(x: 105, y: 62)
                    )
                Image(.balloon)
                    .resizable()
                    .frame(maxWidth: 230, maxHeight: 180)
                    .overlay(
                        Text("We literally don't have time for that.")
                            .multilineTextAlignment(.center)
                            .font(.comfortaaBold(size: 17))
                            .position(x: 96, y: 60)
                            .padding(.horizontal, 30)
                    )
            }
            .padding(.bottom, 490)
        }
    }
}

#Preview {
    UpsetRitaAndRebeca()
}
