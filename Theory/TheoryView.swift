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
        case 6:
            ViewsTheoryPhases.h5.viewTheory()
        case 7:
            ViewsTheoryPhases.h5.viewTheory()
        case 8:
            ViewsTheoryPhases.h6.viewTheory()
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
        default:
            text = "error"
        }
        
        return text
    }
    
    var body: some View {
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
                                phase += 1
                            }
                            .font(.comfortaa(size: 17))
                            .tint(.black)
                        }
                            .position(x: 790, y: 135)
                    )
                    .position(x: 605.5, y: 905)
        }
        
    }
}

#Preview {
    TheoryView()
}
