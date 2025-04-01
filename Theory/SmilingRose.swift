//
//  SmilingRose.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 23/02/25.
//
import SwiftUI
import Foundation

struct SmilingRose: View {
    var body: some View {
        ZStack {
            Image(.rosesmile)
                .resizable()
                .padding(.bottom, 80)
                .frame(maxWidth: 200, maxHeight: 600)
        }
        .padding(.top, 50)
    }
}

#Preview {
    SmilingRose()
}
