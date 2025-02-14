//
//  finalScene.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 13/02/25.
//
import SwiftUI
import Foundation

struct FinalScene: View {
    @State var navigateToNext: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                PurpleBlueLinearGradient()
                Image(.palcoComLuzesIpad)
                    .resizable()
                    .frame(maxWidth: 910, maxHeight: 600)
                    .shadow(radius: 15)
                    .padding(.bottom, 160)
                HStack(spacing: 50) {
                    Image(.ritaCorpoOficial1)
                        .resizable()
                        .frame(width: 135, height: 350)
                    Image(.rebecaCorpoOficialReal)
                        .resizable()
                        .frame(width: 145, height: 350)
                    Image(.roseCorpoOficial1)
                        .resizable()
                        .frame(width: 105, height: 350)
                    Image(.rachelCorpoOficial1)
                        .resizable()
                        .frame(width: 100, height: 365)
                        .padding(.leading, 5)
                        .padding(.trailing, 80)
                }
                .shadow(radius: 5)
                Image(.notas)
                    .position(x: 190, y: 500)
                Image(.notas)
                    .position(x: 1000, y: 450)
                Image(.estrela)
                    .resizable()
                    .frame(maxWidth: 400, maxHeight: 350)
                    .position(x: 1230, y: 260)
                    .shadow(radius: 30)
                Image(.estrela)
                    .resizable()
                    .frame(maxWidth: 400, maxHeight: 350)
                    .position(x: 50, y: 1000)
                    .shadow(radius: 30)
                Text("Pop Queens")
                    .font(.comfortaaBold(size: 50))
                    .padding(.top, 580)
                    .shadow(radius: 1.5)
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(maxWidth: 215, maxHeight: 50)
                        .shadow(radius: 5)
                    RoundedRectangle(cornerRadius: 6)
                        .frame(maxWidth: 210, maxHeight: 45)
                        .foregroundStyle(.white)
                    Button("Restart") {
                        navigateToNext.toggle()
                    }
                    .font(.comfortaa(size: 30))
                    .tint(.black)
                    .navigationDestination(isPresented: $navigateToNext) {
                        StartView()
                    }
                }
                .padding(.top, 720)
            }
        }
    }
}

#Preview {
    FinalScene()
}

//a puta quer dinheiro
//a quenga quer curtição
//e a rapariga quer tudo que é seu
