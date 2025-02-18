//
//  UnavailableValues.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import SwiftUI
import Foundation

struct UnavailableValues: View {
    var body: some View {
        HStack(spacing: -150) {
            N1Board()
            N2Board()
                .padding(.trailing, 30)
            N3Board()
        }
    }
}

#Preview {
    UnavailableValues()
}
