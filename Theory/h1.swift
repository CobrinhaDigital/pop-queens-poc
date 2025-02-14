//
//  h1.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 13/02/25.
//
import SwiftUI
import Foundation

struct h1: View {
    @State var navigateToNext: Bool = false
    @State var transitionPhase: Int = 0
    
    func componentTransitions () {
        
    }
    
    var body: some View {
        ZStack {
            PurpleBlueLinearGradient()
                .ignoresSafeArea()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack(spacing: -20) {
                Image(.startScreen)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 100)
                    .padding(.leading, 30)
                    .padding(.bottom, 100)
                    .shadow(radius: 10)
                TextBlock(text: "The problem faced by the divas goes waaaaay back...")
            }
            .padding(.top, 50)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(maxWidth: 117, maxHeight: 57)
                RoundedRectangle(cornerRadius: 2.5)
                    .frame(maxWidth: 112, maxHeight: 52)
                    .foregroundStyle(.white)
                    .overlay(Button("Next") {
                        transitionPhase += 1
                    }
                        .foregroundStyle(.black)
                        .font(.comfortaa(size: 17))
                )
            }
            .padding(.leading, 790)
            .padding(.top, 670)
        }
    }
}

#Preview {
    h1()
}
