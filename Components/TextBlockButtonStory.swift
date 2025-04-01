//
//  TextBlockButtonStory.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 13/02/25.
//
import SwiftUI
import Foundation

struct TextBlockButtonStory: View {
    @State var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(maxWidth: 117, maxHeight: 57)
            RoundedRectangle(cornerRadius: 2.5)
                .frame(maxWidth: 112, maxHeight: 52)
                .foregroundStyle(.white)
                .overlay(Button(text) {
                    
                }
                    .foregroundStyle(.black)
                    .font(.comfortaa(size: 17))
            )
        }
    }
}

#Preview {
    TextBlockButtonStory(text: "Next")
}
