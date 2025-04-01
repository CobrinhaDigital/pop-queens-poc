//
//  h1.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 13/02/25.
//enum de views
import SwiftUI
import Foundation

struct h1: View {
    @State var navigateToNext: Bool = false
//    @State var transitionPhase: Int = 0
//    var currentView = DivasOnStageView()
    
//    func componentsTransition() {
//        switch transitionPhase {
//        case 0:
//            currentView = DivasOnStageView()
//        default:
//            currentView = DivasFacesTest()
//        }
//    }
    
    var body: some View {
        ZStack {
            PurpleBlueLinearGradient()
                .ignoresSafeArea()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack(spacing: -20) {
                NavigationStack {
                    DivasOnStageView()
                        
                }
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
                        
                    }
                        .foregroundStyle(.black)
                        .font(.comfortaa(size: 17))
                )
            }
            .padding(.leading, 790)
            .padding(.top, 670)
        }
        .onAppear() {
            
        }
    }
}

struct test: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(maxWidth: 117, maxHeight: 57)
            RoundedRectangle(cornerRadius: 2.5)
                .frame(maxWidth: 112, maxHeight: 52)
                .foregroundStyle(.white)
                .overlay(Button("Next") {
                    
                }
                    .foregroundStyle(.black)
                    .font(.comfortaa(size: 17))
            )
        }
        .padding(.leading, 790)
        .padding(.top, 670)
    }
}

#Preview {
    test()
}
