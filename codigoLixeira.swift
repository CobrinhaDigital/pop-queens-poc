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
