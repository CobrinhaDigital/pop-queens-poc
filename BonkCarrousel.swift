//
//  BonkCarrousel.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 25/01/25.
//
import SwiftUI

struct BonkCarrousel: View {
    @State var bonkCount: Int = 1
    @State var navigateToNext: Bool = false
    @State var blockText: String = "The stage is too small!"
    
    @State var widthBonk: CGFloat = 0
    @State var heightBonk: CGFloat = 0
    
    @State var ritaOffsetX: CGFloat = 0
    @State var ritaOffsetY: CGFloat = 0
    
    @State var roseOffsetX: CGFloat = 0
    @State var roseOffsetY: CGFloat = 0
    
    @State var rebecaOffsetX: CGFloat = 0
    @State var rebecaOffsetY: CGFloat = 0
    
    @State var rachelOffsetX: CGFloat = 0
    @State var rachelOffsetY: CGFloat = 0
    
    func textPhases() {
        switch bonkCount {
        case 1:
            print("bonk 1 texto")
            withAnimation {
                blockText = "If they keep their positions, they will surely..."
            }
        case 2:
            withAnimation {
                blockText = "BONK!"
            }
        case 3:
            withAnimation {
                blockText = "Can you help them?"
            }
        default:
            print("Can you help them?")
        }
    }
    
    func increaseSmoke() {
        withAnimation {
            while widthBonk <= 400 {
                widthBonk += 1
            }
            while heightBonk <= 300 {
                heightBonk += 1
            }
        }
    }
    
    func reduceRitaOffset() {
        withAnimation(.easeIn(duration: 2.5)) {
            while ritaOffsetX <= 280 {
                ritaOffsetX += 1
            }
            while ritaOffsetY <= 88 {
                ritaOffsetY += 1
            }
        }
    }
    
    func reduceRoseOffset() {
        withAnimation(.easeIn(duration: 2.5)) {
            while roseOffsetX <= 240 {
                roseOffsetX += 1
            }
            while roseOffsetY <= 60 {
                roseOffsetY += 1
            }
        }
    }
    
    func reduceRebecaOffset() {
        withAnimation(.easeIn(duration: 2.5)) {
            while rebecaOffsetX <= 110 {
                rebecaOffsetX += 1
            }
            while rebecaOffsetY <= 80 {
                rebecaOffsetY += 1
            }
        }
    }
    
    func reduceRachelOffset() {
        withAnimation(.easeIn(duration: 2.5)) {
            while rachelOffsetX <= 105 {
                rachelOffsetX += 1
            }
            while rachelOffsetY <= 60 {
                rachelOffsetY += 1
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(colors: [Color(.azul), Color(.rosa)], center: .center, startRadius: 500, endRadius: 100)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scaledToFill()
                Image(.palco)
                    .position(x: 600, y: 800)
                Group {
                    switch bonkCount {
                    case 1:
                        ZStack {
                            Image(.roseBody)
                                .position(x: 990, y: 490)
                            Image(.ritaBody)
                                .position(x: 240, y: 688)
                            Image(.rebecaBody)
                                .position(x: 820, y: 690)
                            Image(.rachelBody)
                                .position(x: 490, y: 495)
                        }
                    case 2:
                        ZStack {
                            Image(.roseBody)
                                .position(x: 990 - roseOffsetX, y: 490 + roseOffsetY)
                            Image(.rachelBody)
                                .position(x: 490 + rachelOffsetX, y: 495 + rachelOffsetY)
                            Image(.ritaBody)
                                .position(x: 240 + ritaOffsetX, y: 688 - ritaOffsetY)
                            Image(.rebecaBody)
                                .position(x: 820 - rebecaOffsetX, y: 690 - rebecaOffsetY)
                        }
                    case 3:
                        ZStack {
                                Image(.fumaça)
                                    .resizable()
                                    .frame(width: 350 + widthBonk, height: 300 + heightBonk)
                                Image(.estrela)
                                    .resizable()
                                    .frame(width: 100 + widthBonk, height: 150 + heightBonk)
                        }
                    default:
                        ZStack {
                                Image(.fumaça)
                                    .resizable()
                                    .frame(width: 350 + widthBonk, height: 300 + heightBonk)
                                Image(.estrela)
                                    .resizable()
                                    .frame(width: 100 + widthBonk, height: 150 + heightBonk)
                        }
                    }
                }
    //            .animation(.easeInOut, value: bonkCount)
                TextBlockSmall(text: blockText)
                    .position(x: 950, y: 915)
                Button("Next") {
                    textPhases()
                    bonkCount += 1
                    switch bonkCount {
                    case 2:
                        reduceRitaOffset()
                        reduceRebecaOffset()
                        reduceRachelOffset()
                        reduceRoseOffset()
                    case 3:
                        increaseSmoke()
                    case 4:
                        print("esperar")
                    default:
                        navigateToNext = true
                        print("a")
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $navigateToNext) {
                    MechanicsTutorial()
                }
                .position(x: 583, y: 400)
                .frame(maxWidth: 100, maxHeight: 80)
                .padding(.horizontal, 20)
                .foregroundStyle(.black)
                .font(.comfortaa(size: 17))
                .padding(.vertical, 10)
                .background(ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.black))
                        .frame(maxWidth: 82, maxHeight: 50)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.white))
                        .frame(maxWidth: 80, maxHeight: 48)
                }
                    .position(x: 603, y: 410)
                )
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .previewInterfaceOrientation(.landscapeLeft)
        }
        .ignoresSafeArea()
        .transition(.slide)
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

#Preview {
    BonkCarrousel()
}
