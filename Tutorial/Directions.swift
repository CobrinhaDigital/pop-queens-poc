//
//  Directions.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 12/02/25.
//
import SwiftUI
import Foundation

struct DirectionsTutorial: View {
    @State var navigateToNext: Bool = false
    @State var chessTableDiagonal: ChessTableModel = .init(rows: 3, columns: 3)
    @State var chessTableHorizontal: ChessTableModel = .init(rows: 3, columns: 3)
    @State var chessTableVertical: ChessTableModel = .init(rows: 3, columns: 3)
    @State var queensDiagonal: [Queen] = [
        Queen (
            position: (1,1),
            diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen (
            position: (0,0),
            diva: Diva(name: "rebeca", image: Image(.rebecaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        )
    ]
    @State var queensHorizontal: [Queen] = [
        Queen (
            position: (1,1),
            diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen (
            position: (1,2),
            diva: Diva(name: "rachel", image: Image(.rachelFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        )
    ]
    @State var queensVertical: [Queen] = [
        Queen (
            position: (1,1),
            diva: Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        ),
        Queen (
            position: (2,1),
            diva: Diva(name: "rose", image: Image(.roseFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
        )
    ]
    
    var divaPreset = Diva(name: "rita", image: Image(.ritaFace), defaultSize: CGSize(width: 100, height: 100), selectedSize: CGSize(width: 100, height: 100))
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                PurpleBlueLinearGradient()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                RoundedRectangle(cornerRadius: 30)
                    .frame(maxWidth: 1050, maxHeight: 700)
                    .foregroundStyle(.white.opacity(0.4))
                VStack {
                    Text("Directions")
                        .font(.comfortaaBold(size: 45))
                        .padding(.bottom, 10)
                    Text("The divas can go in any direction. However, keep in mind that they will collide if placed like this:")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 250)
                    .padding(.bottom, 50)
                    .font(.comfortaa(size: 25))
                    HStack(spacing: -350) {
                        Stage(
                            chessTable: $chessTableVertical,
                            queens: $queensVertical
                        )
                        Stage(
                            chessTable: $chessTableHorizontal,
                            queens: $queensHorizontal
                        )
                        Stage(
                            chessTable: $chessTableDiagonal,
                            queens: $queensDiagonal
                        )
                    }
                    .padding(.bottom, 50)
                    Button("Got it!") {
                        navigateToNext.toggle()
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: 200, maxHeight: 60)
                    .padding(.horizontal, 20)
                    .foregroundStyle(.black)
                    .font(.comfortaa(size: 30))
                    .navigationDestination(isPresented: $navigateToNext) {
                        HaveFun()
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
                .font(.comfortaaBold(size: 25))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DirectionsTutorial()
}

