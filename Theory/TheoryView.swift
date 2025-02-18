//
//  TheoryView.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

struct TheoryView: View {
    @State var phases: Int = 0
    var foo: () -> Void = {}
    
    @ViewBuilder
    func transitionPhases() -> some View {
        switch phases {
        case 0:
            ViewsTheoryPhases.h1.viewTheory()
        default:
            ViewsTheoryPhases.h2.viewTheory()
        }
    }
    
    var body: some View {
        ZStack {
            PurpleBlueLinearGradient()
                .ignoresSafeArea()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                ViewsTheoryPhases.h2.viewTheory()
                TextBlock(text: "The problem faced by the divas goes waaaaay back...")
                    .overlay(
                        ButtonNext(action: foo)
                            .position(x: 790, y: 135)
                    )
            }
        }
    }
}

#Preview {
    TheoryView()
}
