//
//  TextBlockSmallButton.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 08/02/25.
//
import SwiftUI

struct TextBlockSmallButton: View {
    var body: some View {
        Button("Next") {

        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: 100, maxHeight: 80)
        .padding(.horizontal, 20)
        .foregroundStyle(.black)
        .font(.comfortaa(size: 17))
        .padding(.vertical, 10)
        .background(ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.black))
                .frame(maxWidth: 82, maxHeight: 50)
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.white))
                .frame(maxWidth: 80, maxHeight: 48)
        })
    }
}

#Preview {
    ZStack {
        Color.blue
        TextBlockSmallButton()
    }
}
