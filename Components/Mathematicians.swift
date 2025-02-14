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
                    .padding(.leading, 200)
                Image(.siegmundGüntherFranzNeumayerNeumayerFranzBtv1B8453112XCropped2)
            }
            .shadow(radius: 5)
            HStack(spacing: 150) {
                Image(.carlFriedrichGauss3)
                Image(.jamesWhitbreadLeeGlaisher2)
                    .padding(.trailing, 200)
            }
            .shadow(radius: 5)
        }
    }
}

#Preview {
    MathematiciansView()
}
