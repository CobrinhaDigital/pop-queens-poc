//
//  Fonts.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 03/02/25.
//

import SwiftUI

extension Font {
    static func comfortaa(size: CGFloat) -> Font {
        let cfURL = Bundle.main.url(
            forResource: "Comfortaa-Regular", // Nome do ARQUIVO
            withExtension: "ttf"
        )! as CFURL
        
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        
        let uiFont = UIFont(name: "Comfortaa-Regular", size:  size) // Nome da FONTE
        
        return Font(uiFont ?? UIFont())
    }
    
    static func comfortaaBold(size: CGFloat) -> Font {
        let cfURL = Bundle.main.url(
            forResource: "Comfortaa-Bold", // Nome do ARQUIVO
            withExtension: "ttf"
        )! as CFURL
        
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        
        let uiFont = UIFont(name: "Comfortaa-Bold", size:  size) // Nome da FONTE
        
        return Font(uiFont ?? UIFont())
    }
    
    static func trattatello(size: CGFloat) -> Font {
        let cfURL = Bundle.main.url(
            forResource: "Trattatello", // Nome do ARQUIVO
            withExtension: "ttf"
        )! as CFURL
        
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        
        let uiFont = UIFont(name: "Trattatello", size:  size) // Nome da FONTE
        
        return Font(uiFont ?? UIFont())
    }
}

struct Fonts: View {
    var body: some View {
        Text("Hello, world!")
            .font(.comfortaa(size: 50))
            .fontWeight(.light)
        Text("Hello, world!")
            .font(.trattatello(size: 50))
        Text("Hello, world!")
            .font(.comfortaaBold(size: 50))
    }
    
}

#Preview {
    Fonts()
}
