//
//  Mac.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 23/02/25.
//
import SwiftUI
import Foundation

struct MacView: View {
    var body: some View {
        Image(.macbookGray)
            .resizable()
            .padding(.bottom, 50)
            .frame(maxWidth: 850, maxHeight: 500)
    }
}

#Preview {
    MacView()
}
