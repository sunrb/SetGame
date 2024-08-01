//
//  Cards.swift
//  SetGame
//
//  Created by Rubing on 8/1/24.
//

import Foundation

struct Card {
    
    let id: Int
    let shape: CardShape
    let color: CardColor
    let numberOfShape: Int
    let shading: CardShading
    var isMatched: Bool?
    var isSelected: Bool = false

    enum CardShape {
        case diamond
        case oval
        case squiggle
    }

    enum CardColor {
        case red
        case purple
        case green
    }

    enum CardShading {
        case solid
        case striped
        case outlined
    }
}


