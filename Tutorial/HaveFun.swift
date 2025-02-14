//
//  HaveFun.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 12/02/25.
//
import SwiftUI
import Foundation

struct HaveFun: View {
    @State var navigateToNext: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                PurpleBlueLinearGradient()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                RoundedRectangle(cornerRadius: 30)
                    .frame(maxWidth: 1050, maxHeight: 700)
                    .foregroundColor(.white.opacity(0.4))
                VStack {
                    Text("Have fun!")
                        .font(.comfortaaBold(size: 40))
                        .padding(.bottom, 5)
                    Text("Don't worry, you can look it up again 🩷")
                        .font(.comfortaa(size: 20))
                    HStack {
                        Image(.ritaFace)
                            .resizable()
                            .shadow(radius: 5)
                            .frame(width: 150, height: 150)
                        Image(.rebecaFace)
                            .resizable()
                            .shadow(radius: 5)
                            .frame(width: 160, height: 160)
                        Image(.roseFace)
                            .resizable()
                            .shadow(radius: 5)
                            .frame(width: 120, height: 170)
                        Image(.rachelFace)
                            .resizable()
                            .shadow(radius: 5)
                            .frame(width: 120, height: 180)
                            .padding(.leading, 10)
                    }
                    .padding(.vertical, 80)
                    Button("Play") {
                        navigateToNext.toggle()
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: 200, maxHeight: 60)
                    .padding(.horizontal, 20)
                    .foregroundStyle(.black)
                    .font(.comfortaa(size: 30))
                    .padding(.vertical, 10)
                    .navigationDestination(isPresented: $navigateToNext) {
                        ContentView()
                    }
                    .background(ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.black))
                            .shadow(radius: 5)
                            .frame(maxWidth: 182, maxHeight: 60)
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.white))
                            .frame(maxWidth: 180, maxHeight: 58)
                    })
                }
            }
        }
    }
}

#Preview {
    HaveFun()
}
