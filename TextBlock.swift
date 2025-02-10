//
//  TextBlock.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 03/02/25.
//

import SwiftUI

struct TextBlock: View {
    @AppStorage("fontType") private var fontType = "Comfortaa-Regular"
    
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: 807, maxHeight: 147)
                .foregroundStyle(.black)
                .overlay(RoundedRectangle(cornerRadius: 2.5)
                    .frame(maxWidth: 800, maxHeight: 140)
                    .foregroundStyle(.white))
            Text(text)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: 790, maxHeight: 130)
                .font(.comfortaa(size: 17))
                .foregroundStyle(.black)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(maxWidth: 117, maxHeight: 57)
                RoundedRectangle(cornerRadius: 2.5)
                    .frame(maxWidth: 112, maxHeight: 52)
                    .foregroundStyle(.white)
                    .overlay(Button("Next") {
                        
                    }
                        .foregroundStyle(.black)
                        .font(.comfortaa(size: 17))
                )
            }
            .padding(.leading, 800)
            .padding(.top, 130)
        }
    }
}

#Preview {
    ZStack {
        Color.blue
        TextBlock(text: """
        Meu nome é Yoshikage Kira. Tenho 33 anos. Minha casa fica na parte nordeste de Morioh, onde todas as casas estão, e eu não sou casado. Eu trabalho como funcionário das lojas de departamentos Kame Yu e chego em casa todos os dias às oito da noite, no máximo. Eu não fumo, mas ocasionalmente bebo. Estou na cama às 23 horas e me certifico de ter oito horas de sono, não importa o que aconteça. Depois de tomar um copo de leite morno e fazer cerca de vinte minutos de alongamentos antes de ir para a cama, geralmente não tenho problemas para dormir até de manhã. Assim como um bebê, eu acordo sem nenhum cansaço ou estresse pela manhã. Foi-me dito que não houve problemas no meu último check-up. Estou tentando explicar que sou uma pessoa que deseja viver uma vida muito tranquila. Eu cuido para não me incomodar com inimigos, como ganhar e perder, isso me faria perder o sono à noite. É assim que eu lido com a sociedade e sei que é isso que me traz felicidade. Embora, se eu fosse lutar, não perderia para ninguém.
        """)
    }
}

