//
//  Cityscape.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 03/02/25.
//
import SwiftUI

//TO DO: corrigir numeros e editar no figma
//para uma tela de 13 polegadas, o assets nao sentam direito
//funciona para qualquer de ipad menor, exceto para maiores

struct Cityscape: View {
    @State var enableParallax: Bool = false
    @State var navigateToNext: Bool = false
    @State var blockText: String = "The divas are going to a show!"
    @State var nextCount: Int = 0
    @State var city: CGFloat = 0
    @State var road: CGFloat = 0
    
    func reduceX() {
        while city <= 2105 {
            city += 1
        }
        while road <= 850 {
            road += 1
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color(.ceuAmareloTransicao), Color(.azulCeu)], startPoint: .top, endPoint: .bottom)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scaledToFill()
                Image(.cityscapeFinalForm)
                //dimminuir x faz a cidade ir pro final
                //                .position(x: enableParallax ? 2025 - 100 : 610, y: 184.5)
                    .position(x: enableParallax ? 2025 - city : 1305, y: 330.8)
                    .animation(.easeInOut(duration: 8), value: city)
                Image(.parteImovelOficial)
                    .padding(.top, 374)
                    .position(x: enableParallax ? 1000 - road : 1000, y: 554.5)
                    .animation(.easeInOut(duration: 8), value: road)
                Image(.carro)
                    .position(x: 500, y: 745)
                TextBlockSmall(text: blockText)
                    .position(x: 950, y: 925)
                Button("Next") {
                    nextCount += 1
                    if nextCount <= 1 {
                        withAnimation {
                            enableParallax = true
                            reduceX()
                            print(nextCount)
                            print(enableParallax)
                            withAnimation(.smooth(duration: 2.5)) {
                                blockText = "But there is a problem..."
                            }
                        }
                    } else {
                        navigateToNext = true
                    }
                }
                .navigationDestination(isPresented: $navigateToNext) {
                    BonkCarrousel()
                }
                .navigationBarBackButtonHidden(true)
                .frame(maxWidth: 100, maxHeight: 80)
                .position(x: 1120, y: 965)
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
                    .position(x: 1140, y: 975)
                )
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
                .previewInterfaceOrientation(.landscapeLeft)
            }
        }
        .ignoresSafeArea()
        .transition(.slide)
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

#Preview {
    Cityscape()
}
