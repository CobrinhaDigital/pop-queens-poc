////
////  codigoLixeira.swift
////  pop-queens
////
////  Created by Beatriz Peixoto on 05/12/24.
////
//
//struct CharCircleView: View {
//    @State var charCircle = CharCircle.init(height: 30, width: 30, tapCount: 0)
//    @State var colors: [Color] = [.green, .yellow, .purple, .cyan, .mint, .pink, .indigo]
//    
//    @State var isSelected: Int? = nil
//    
//    var body: some View {
//        ScrollView(.horizontal) {
//            HStack {
//                ForEach(0..<colors.count, id: \.self) { index in
//                    let width = isSelected == index ? charCircle.width + 10 : charCircle.width
//                    let height = isSelected == index ? charCircle.height + 10 : charCircle.height
//                    Circle()
//                        .frame(maxWidth: width, maxHeight: height)
//                        .foregroundStyle(colors[index])
//                        .onTapGesture {
//                            isSelected = index
////                            charCircle.tapCount += 1
////                            if charCircle.tapCount%2 != 0 {
////                                charCircle.width += 10
////                                charCircle.height += 10
////                            } else {
////                                charCircle.width -= 10
////                                charCircle.height -= 10
////                            }
//                        }
//                }
//            }
//        }
//        .padding(.horizontal)
//        .scrollIndicators(.hidden)
//    }
//}
//
//struct CharCircle {
//    var height: CGFloat
//    var width: CGFloat
//    var tapCount: Int
//}

import SwiftUI

struct DivaView: View {

    
    @State private var isSelectedByID: UUID?
    @State private var tapCount: Int = 0
    
    let divas = [
        Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 65, height: 60), selectedSize: CGSize(width: 75, height: 70)),
        Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 70, height: 65), selectedSize: CGSize(width: 80, height: 75)),
        Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 55, height: 70), selectedSize: CGSize(width: 65, height: 85)),
        Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 55, height: 70), selectedSize: CGSize(width: 65, height: 85))
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
    DivaView()
}
