//
//  DivaBonkView.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 22/01/25.
//

import SwiftUI

struct StageWithSpotlightView: View {
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color(.azul), Color(.rosa)], center: .center, startRadius: 500, endRadius: 100)
            Image(.palcoComLuzesIpad)
        }
        .ignoresSafeArea()
        .previewInterfaceOrientation(.landscapeRight)
    }
}

#Preview {
    StageWithSpotlightView()
}
