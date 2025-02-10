//
//  TextBlockSmall.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 07/02/25.
//
import SwiftUI

struct TextBlockSmall: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.black)
                .frame(maxWidth: 400, maxHeight: 120)
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(.white)
                .frame(maxWidth: 396, maxHeight: 116)
            Text(text)
                .foregroundStyle(.black)
                .frame(maxWidth: 380, maxHeight: 112)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: true, vertical: false)
                .font(.comfortaa(size: 20))
        }
    }
}

#Preview {
    ZStack {
        Color(.blue)
        TextBlockSmall(text: "Nenhuma estética equivocada constrange tanto quanto a vulgaridade da amargura.")
    }
}
