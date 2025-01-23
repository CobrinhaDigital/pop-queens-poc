//
//  DivaBonk02.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 23/01/25.
//

import SwiftUI

struct DivaBonk02: View {
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color(.azul), Color(.rosa)], center: .center, startRadius: 500, endRadius: 100)
            Image(.esbarro2)
        }
        .ignoresSafeArea()
        .previewInterfaceOrientation(.landscapeRight)
    }
}

#Preview {
    DivaBonk02()
}
