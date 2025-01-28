//
//  codigoLixeira.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 05/12/24.
//


import SwiftUI

struct DivasFacesTest: View {

    
    @State private var isSelectedByID: UUID?
    @State private var tapCount: Int = 0
    
    let divas = [
        Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 95, height: 93), selectedSize: CGSize(width: 110, height: 105)),
        Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 108, height: 100), selectedSize: CGSize(width: 118, height: 110)),
        Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 80, height: 105), selectedSize: CGSize(width: 95, height: 115)),
        Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 80, height: 110), selectedSize: CGSize(width: 95, height: 125))
    ]
    
    var body: some View {
        HStack {
            ForEach(divas) { diva in
                diva.image
                    .resizable()
                    .contentShape(.rect)
                    .onTapGesture {
                        if tapCount % 2 == 0 {
                            isSelectedByID = diva.id
                        } else {
                            isSelectedByID = nil
                        }
                        tapCount += 1
                    }
                    .frame(maxWidth: (isSelectedByID == diva.id) ? diva.selectedSize.width : diva.defaultSize.width, maxHeight: (isSelectedByID == diva.id) ?  diva.selectedSize.height : diva.defaultSize.height)
                    .animation(.easeInOut, value: isSelectedByID)
                    .shadow(radius: 5)
            }
        }
    }
}

#Preview {
    DivasFacesTest()
}
