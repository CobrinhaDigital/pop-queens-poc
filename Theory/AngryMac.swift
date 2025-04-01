//
//  AngryMac.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 23/02/25.
//
import SwiftUI
import Foundation

struct AngryMac: View {
    var body: some View {
        Image(.angrymac)
            .resizable()
            .padding(.bottom, 50)
            .frame(maxWidth: 850, maxHeight: 500)
    }
}

#Preview {
    AngryMac()
}
