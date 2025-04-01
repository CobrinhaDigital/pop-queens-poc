//
//  ButtonNext.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 18/02/25.
//
import Foundation
import SwiftUI

struct ButtonNext: View {
    //    var action: () -> Void
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: 100, maxHeight: 55)
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(.white)
                .frame(maxWidth: 95, maxHeight: 50)
            Button("Next") {
                
            }
            .font(.comfortaa(size: 17))
            .tint(.black)
        }
    }
}

#Preview {
    ZStack {
        Color.green
        ButtonNext()
    }
}
