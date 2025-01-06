//
//  BoardView.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 03/01/25.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        ZStack {
            Image(.gradiente)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                HStack {
                    Image(.ritaFace)
                        .resizable()
                        .frame(maxWidth: 65, maxHeight: 60)
                    Image(.roseFace)
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 70)
                    Image(.rebecaFace)
                        .resizable()
                        .frame(maxWidth: 68, maxHeight: 65)
                    Image(.rachelFace)
                        .resizable()
                        .frame(maxWidth: 50, maxHeight: 70)
                }
//                ContentView()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BoardView()
}
