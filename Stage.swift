//
//  Stage.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 27/01/25.
//
import SwiftUI

struct Stage: View {
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(130), spacing: 0), count: 1), spacing: 1) {
            ForEach(0..<5 ,id: \.self) {tiles in 
                Rectangle()
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    Stage()
}
