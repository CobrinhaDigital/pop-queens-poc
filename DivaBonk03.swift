//
//  DivaBon03.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 24/01/25.
//

import SwiftUI

struct DivaBonk03: View {
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color(.azul), Color(.rosa)], center: .center, startRadius: 500, endRadius: 100)
                .edgesIgnoringSafeArea(.all)
            Image(.palco)
                .padding(.top, 360)
            Image(.fumaça)
            Image(.estrela)
        }
    }
}

#Preview {
    DivaBonk03()
}
