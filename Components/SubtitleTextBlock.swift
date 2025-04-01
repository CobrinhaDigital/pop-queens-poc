//
//  SubtitleTextBlock.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

struct SubtitleTextBlock: View {
    var text: String
    var outerWidth: CGFloat?
    var outerHeight: CGFloat?
    var innerWidth: CGFloat?
    var innerHeight: CGFloat?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: outerWidth ?? 120, maxHeight: outerHeight ?? 35)
            RoundedRectangle(cornerRadius: 6)
                .frame(maxWidth: innerWidth ?? 115, maxHeight: innerHeight ?? 30)
                .foregroundStyle(.white)
            Text(text)
                .font(.comfortaa(size: 17))
        }
    }
}

#Preview {
    SubtitleTextBlock(text: "Hello world!")
}
