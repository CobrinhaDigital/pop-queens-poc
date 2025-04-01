//
//  TheoryView.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

struct TheoryView: View {
    @State var phase: Int = 0
    @State var endTheory: Bool = false
    
    @ViewBuilder
    func transitionPhases() -> some View {
        switch phase {
        case 0:
            ViewsTheoryPhases.h1.viewTheory()
        case 1:
            ViewsTheoryPhases.h2.viewTheory()
        case 2:
            ViewsTheoryPhases.h2.viewTheory()
        case 3:
            ViewsTheoryPhases.h3.viewTheory()
        case 4:
            ViewsTheoryPhases.h3.viewTheory()
        case 5:
            ViewsTheoryPhases.h4.viewTheory()
        case 6, 7:
            ViewsTheoryPhases.h5.viewTheory()
        case 8:
            ViewsTheoryPhases.h6.viewTheory()
        case 9:
            ViewsTheoryPhases.h7.viewTheory()
        case 10:
            ViewsTheoryPhases.h8.viewTheory()
        case 11:
            ViewsTheoryPhases.h9.viewTheory()
        case 12:
            ViewsTheoryPhases.h10.viewTheory()
        case 13, 14:
            ViewsTheoryPhases.h10.viewTheory()
        case 15:
            ViewsTheoryPhases.h11.viewTheory()
        case 16:
            ViewsTheoryPhases.h11.viewTheory()
        case 17:
            ViewsTheoryPhases.h10.viewTheory()
        case 18:
            ViewsTheoryPhases.h10.viewTheory()
        case 19:
            ViewsTheoryPhases.h12.viewTheory()
        case 20:
            ViewsTheoryPhases.h12.viewTheory()
        case 21:
            ViewsTheoryPhases.h13.viewTheory()
        case 22:
            ViewsTheoryPhases.h13.viewTheory()
        case 23, 24, 25:
            ViewsTheoryPhases.h14.viewTheory()
        case 26:
            ViewsTheoryPhases.h15.viewTheory()
        case 27:
            ViewsTheoryPhases.h15.viewTheory()
        case 28:
            ViewsTheoryPhases.h15.viewTheory()
        case 29:
            ViewsTheoryPhases.h15.viewTheory()
        case 30:
            ViewsTheoryPhases.h16.viewTheory()
        case 31:
            ViewsTheoryPhases.h17.viewTheory()
        case 32:
            ViewsTheoryPhases.h18.viewTheory()
        case 33:
            ViewsTheoryPhases.h18.viewTheory()
        case 34:
            ViewsTheoryPhases.h19.viewTheory()
        case 35:
            ViewsTheoryPhases.h19.viewTheory()
        case 36:
            ViewsTheoryPhases.h20.viewTheory()
        case 37:
            ViewsTheoryPhases.h21.viewTheory()
        case 38, 39, 40, 41, 42, 43, 44:
            ViewsTheoryPhases.h23.viewTheory()
        case 45:
            ViewsTheoryPhases.h24.viewTheory()
        case 46:
            ViewsTheoryPhases.h25.viewTheory()
        case 47:
            ViewsTheoryPhases.h26.viewTheory()
        case 48:
            ViewsTheoryPhases.h27.viewTheory()
        case 49:
            ViewsTheoryPhases.h28.viewTheory()
        default:
            ViewsTheoryPhases.h1.viewTheory()
        }
    }
    
    func transitionTexts() -> String {
        var text: String
        
        switch phase {
        case 0:
            text = TextEnum.h1.text()
        case 1:
            text = TextEnum.h2.text()
        case 2:
            text = TextEnum.h3.text()
        case 3:
            text = TextEnum.h4.text()
        case 4:
            text = TextEnum.h5.text()
        case 5:
            text = TextEnum.h6.text()
        case 6:
            text = TextEnum.h7.text()
        case 7:
            text = TextEnum.h8.text()
        case 8:
            text = TextEnum.h9.text()
        case 9:
            text = TextEnum.h10.text()
        case 10:
            text = TextEnum.h11.text()
        case 11:
            text = TextEnum.h12.text()
        case 12:
            text = TextEnum.h13.text()
        case 13:
            text = TextEnum.h14.text()
        case 14:
            text = TextEnum.h15.text()
        case 15:
            text = TextEnum.h16.text()
        case 16:
            text = TextEnum.h17.text()
        case 17:
            text = TextEnum.h18.text()
        case 18:
            text = TextEnum.h19.text()
        case 19:
            text = TextEnum.h20.text()
        case 20:
            text = TextEnum.h21.text()
        case 21:
            text = TextEnum.h22.text()
        case 22:
            text = TextEnum.h23.text()
        case 23:
            text = TextEnum.h23.text()
        case 24:
            text = TextEnum.h24.text()
        case 25:
            text = TextEnum.h25.text()
        case 26:
            text = TextEnum.h26.text()
        case 27:
            text = TextEnum.h27.text()
        case 28:
            text = TextEnum.h28.text()
        case 29:
            text = TextEnum.h29.text()
        case 30:
            text = TextEnum.h30.text()
        case 31:
            text = TextEnum.h31.text()
        case 32:
            text = TextEnum.h32.text()
        case 33:
            text = TextEnum.h33.text()
        case 34:
            text = TextEnum.h34.text()
        case 35:
            text = TextEnum.h35.text()
        case 36:
            text = TextEnum.h36.text()
        case 37:
            text = TextEnum.h37.text()
        case 38:
            text = TextEnum.h38.text()
        case 39:
            text = TextEnum.h39.text()
        case 40:
            text = TextEnum.h40.text()
        case 41:
            text = TextEnum.h41.text()
        case 42:
            text = TextEnum.h42.text()
        case 43:
            text = TextEnum.h43.text()
        case 44:
            text = TextEnum.h44.text()
        case 45:
            text = TextEnum.h45.text()
        case 46:
            text = TextEnum.h46.text()
        case 47:
            text = TextEnum.h47.text()
        case 48:
            text = TextEnum.h48.text()
        case 49:
            text = TextEnum.h48.text()
        default:
            text = "error"
        }
        print(phase)
        return text
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                PurpleBlueLinearGradient()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    transitionPhases()
                    .position(x: 605.5, y: 565)
                    TextBlock(text: transitionTexts())
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(maxWidth: 100, maxHeight: 55)
                                RoundedRectangle(cornerRadius: 6)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: 95, maxHeight: 50)
                                Button("Next") {
                                    if phase >= 49 {
                                        endTheory.toggle()
                                    }
                                    phase += 1
                                }
                                .font(.comfortaa(size: 17))
                                .tint(.black)
                            }
                                .position(x: 790, y: 135)
                        )
                        .position(x: 605.5, y: 905)
                        .navigationDestination(isPresented: $endTheory) {
                            FinalScene()
                        }
            }
        }
    }
}

#Preview {
    TheoryView()
}
