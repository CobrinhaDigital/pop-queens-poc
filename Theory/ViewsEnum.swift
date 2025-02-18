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
    
    //se esse decorator os cases so podem ser da mesma tela
    @ViewBuilder
    func viewTheory () -> some View {
        switch self {
        case .h1:
            DivasOnStageView()
        case .h2:
            MathematiciansView()
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
