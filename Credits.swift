//
//  Credits.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 23/02/25.
//
import SwiftUI
import Foundation

struct Credits: View {
    var body: some View {
        ZStack {
            PurpleBlueLinearGradient()
            RoundedRectangle(cornerRadius: 30)
                .frame(maxWidth: 1050, maxHeight: 700)
                .foregroundStyle(.white.opacity(0.4))
            Image(.eorr)
                .resizable()
                .frame(maxWidth: 370, maxHeight: 420)
                .shadow(radius: 5)
                .border(.black)
        }
    }
}

#Preview {
    Credits()
}
