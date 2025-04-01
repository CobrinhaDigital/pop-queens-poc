//
//  Mathematicians.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 13/02/25.
//
import SwiftUI
import Foundation

struct MathematiciansView: View {
    var body: some View {
        VStack {
            HStack(spacing: 180) {
                Image(.maxBezzel3)
                    .resizable()
                    .frame(maxWidth: 250, maxHeight: 280)
                Image(.siegmundGüntherFranzNeumayerNeumayerFranzBtv1B8453112XCropped2)
                    .resizable()
                    .frame(maxWidth: 240, maxHeight: 285)
            }
            .shadow(radius: 5)
            HStack(spacing: 150) {
                Image(.carlFriedrichGauss3)
                    .resizable()
                    .frame(maxWidth: 240, maxHeight: 285)
                Image(.jamesWhitbreadLeeGlaisher2)
                    .resizable()
                    .frame(maxWidth: 240, maxHeight: 285)
                    .padding(.trailing, 200)
            }
            .shadow(radius: 5)
        }
        .padding(.bottom, 100)
    }
}

#Preview {
    MathematiciansView()
}
