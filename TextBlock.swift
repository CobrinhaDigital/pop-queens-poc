//
//  TextBlock.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 03/02/25.
//

import SwiftUI

struct TextBlock: View {
    @AppStorage("fontType") private var fontType = "Comfortaa-Regular"
    
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: 807, maxHeight: 147)
                .foregroundStyle(.black)
                .overlay(RoundedRectangle(cornerRadius: 2.5)
                    .frame(maxWidth: 800, maxHeight: 140)
                    .foregroundStyle(.white))
            Text(text)
                .multilineTextAlignment(.leading)
                .padding(.trailing, 350)
                .frame(maxWidth: 790, maxHeight: 130)
                .font(.custom("Comfortaa-Regular", size: 17))
                .foregroundStyle(.black)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(maxWidth: 117, maxHeight: 57)
                RoundedRectangle(cornerRadius: 2.5)
                    .frame(maxWidth: 112, maxHeight: 52)
                    .foregroundStyle(.white)
                    .overlay(Button("Next") {
                        
                    }
                        .foregroundStyle(.black)
                )
            }
            .padding(.leading, 800)
            .padding(.top, 130)
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        TextBlock(text: """
        It’s pretty close, but there's an issue. 
        
        Rebeca is coliding with all three divas, not ideal at all. 
        
        Let’s take her out of the stage for a moment, shall we?
        """)
    }
}

