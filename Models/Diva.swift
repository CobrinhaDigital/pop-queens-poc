//
//  Diva.swift
//  pop-queens
//
//  Created by Beatriz Peixoto on 10/02/25.
//
import SwiftUI
import Foundation

struct Diva: Equatable, Identifiable {
    let id = UUID()
    let name: String
    var image: Image
    let defaultSize: CGSize
    let selectedSize: CGSize
}
