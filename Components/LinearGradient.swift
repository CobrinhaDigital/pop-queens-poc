//
//  LinearGradient.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 11/02/25.
//
import SwiftUI
import Foundation

struct PurpleBlueLinearGradient: View {
    var body: some View {
        LinearGradient(colors: [Color(.rosa), .purple, Color(.azul), .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scaledToFill()
    }
}

#Preview {
    PurpleBlueLinearGradient()
}
