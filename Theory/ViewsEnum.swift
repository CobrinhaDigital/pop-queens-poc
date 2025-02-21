//
//  ViewsEnum.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 17/02/25.
//
import SwiftUI
import Foundation

enum ViewsTheoryPhases {
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    case h7
    case h8
    case h9
    case h10
    
    //se esse decorator os cases so podem ser da mesma tela
    @MainActor @ViewBuilder
    func viewTheory () -> some View {
        switch self {
        case .h1:
            DivasOnStageView()
        case .h2:
            MathematiciansView()
        case .h3:
            ChessMagazineImageView()
        case .h4:
            UnavailableValues()
        case .h5:
            OutOfStates()
        case .h6:
            ThinkingEmojiBig()
        case .h7:
            AvailableSpaces()
        case .h8:
            EmptyStage()
        default:
            Text("bi sexo uau")
        }
    }
}

struct ViewsEnumPreview: View {
    var body: some View {
        ViewsTheoryPhases.h1.viewTheory()
    }
}

#Preview {
    ViewsEnumPreview()
}
