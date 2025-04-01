//
//  TextBlockButton.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 12/02/25.
//
import SwiftUI
import Foundation

struct TextBlockButton: View {
    var text: String
    
    var body: some View {
        Button(text) {
            
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: 200, maxHeight: 60)
        .padding(.horizontal, 20)
        .foregroundStyle(.black)
        .font(.comfortaa(size: 30))
        .padding(.vertical, 10)
        .background(ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.black))
                .shadow(radius: 5)
                .frame(maxWidth: 182, maxHeight: 60)
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.white))
                .frame(maxWidth: 180, maxHeight: 58)
        })
    }
}

#Preview {
    ZStack {
        Color.blue
        TextBlockButton(text: "Test")
    }
}
