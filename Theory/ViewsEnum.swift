//
//  ViewsEnum.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 17/02/25.
//
import SwiftUI
import Foundation

enum ViewsTheoryPhases {
    case h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30
    
    //sem esse decorator os cases so podem ser da mesma tela
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
            OutOfStates(divaPosition: .constant((0,0)))
        case .h6:
            ThinkingEmojiBig()
        case .h7:
            AvailableSpaces()
        case .h8:
            EmptyStage()
        case .h9:
            Solutions()
        case .h10:
            ThreeOutOfFour()
        case .h11:
            Backtracking()
        case .h12:
            OffWithRebecaStage()
        case .h13:
            QueensMovementsLines()
        case .h14:
            RebecaInteractiveBoard()
        case .h15:
            BacktrackingWorstCase()
        case .h16:
            MacView()
        case .h17:
            AngryMac()
        case .h18:
            Instructions()
        case .h19:
            InstructionsAndStage()
        case .h20:
            Code1()
        case .h21:
            Code2()
        case .h22:
            Code3()
        case .h23:
            Graph()
        case .h24:
            UpsetRitaAndRebeca()
        case .h25:
            UpsetThreeDivas()
        case .h26:
            UpsetAllDivas()
        case .h27:
            HappyRose()
        case .h28:
            SmilingRose()
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
