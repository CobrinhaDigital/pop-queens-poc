//
//  UpsetAllDivas.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 23/02/25.
//
import SwiftUI
import Foundation

struct UpsetAllDivas: View {
    var body: some View {
        ZStack {
            HStack {
                Image(.ritaCorpoOficial)
                    .resizable()
                    .frame(maxWidth: 230, maxHeight: 500)
                Image(.rebecaCorpoOficial)
                    .resizable()
                    .frame(maxWidth: 240, maxHeight: 500)
                Image(.upsetRachel)
                    .resizable()
                    .frame(maxWidth: 170, maxHeight: 500)
                Image(.roseSad)
                    .resizable()
                    .frame(maxWidth: 170, maxHeight: 500)
            }
            .padding(.trailing, 50)
            HStack {
                Image(.balloon)
                    .resizable()
                    .position(x: 570, y: 70)
                    .frame(maxWidth: 180, maxHeight: 150)
                    .overlay(
                        Text("Sorry for cutting you short.")
                            .multilineTextAlignment(.center)
                            .font(.comfortaaBold(size: 17))
                            .position(x: 550, y: 42)
                            .padding(.horizontal, 30)
                    )
            }
            .padding(.bottom, 490)
        }
    }
}

#Preview {
    UpsetAllDivas()
}
