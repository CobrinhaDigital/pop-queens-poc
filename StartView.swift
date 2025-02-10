//
//  StartView.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 06/02/25.
//
import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color(.rosa), .purple, Color(.azul), .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: .infinity, height: .infinity)
                    .scaledToFill()
                    .ignoresSafeArea()
                    .previewInterfaceOrientation(.landscapeLeft)
                VStack {
                    Text("Pop Queens")
                        .font(.comfortaaBold(size: 70))
                        .padding(.bottom, 50)
                        .shadow(radius: 2.5)
                    Image(.startScreen)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 100)
                        .padding(.leading, 30)
                        .padding(.bottom, 100)
                        .shadow(radius: 10)
                }
                Image(.estrela)
                    .resizable()
                    .frame(maxWidth: 400, maxHeight: 350)
                    .position(x: 1150, y: 280)
                    .shadow(radius: 30)
                Image(.estrela)
                    .resizable()
                    .frame(maxWidth: 400, maxHeight: 350)
                    .position(x: 50, y: 950)
                    .shadow(radius: 30)
                NavigationLink("Start", destination: Cityscape().navigationBarBackButtonHidden(true))
                    .font(.comfortaa(size: 40))
                    .foregroundStyle(.black)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.black)
                                .padding(.horizontal, -42)
                                .padding(.vertical, -12)
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundStyle(.white)
                                .padding(.horizontal, -40)
                                .padding(.vertical, -10)
                        }
                    )
                    .padding(.top, 650)
            }
        }
        .ignoresSafeArea()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

#Preview {
    StartView()
}
