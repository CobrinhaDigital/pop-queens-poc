//
//  DivasOnStageView.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 17/02/25.
//
import SwiftUI
import Foundation

struct DivasOnStageView: View {
    var body: some View {
        ZStack {
            Image(.palco)
                .resizable()
                .frame(maxWidth: 1050, maxHeight: 200)
                .padding(.top, 200)
            HStack(spacing: 20) {
                Image(.ritaCorpoOficial1)
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 400)
                Image(.rebecaCorpoOficialReal)
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 400)
                Image(.roseCorpoOficial1)
                    .resizable()
                    .frame(maxWidth: 140, maxHeight: 410)
                Image(.rachelCorpoOficial1)
                    .resizable()
                    .padding(.leading, 20)
                    .frame(maxWidth: 160, maxHeight: 420)
            }
            .padding(.bottom, 160)
            .padding(.trailing, 80)
        }
    }
}

#Preview {
    DivasOnStageView()
}
