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
    var isSet: Bool?
    var isSelected: Bool = false

    enum CardShape: CaseIterable {
        case diamond
        case oval
        case squiggle
    }

    enum CardColor: CaseIterable {
        case red
        case purple
        case green
    }

    enum CardShading: CaseIterable {
        case solid
        case striped
        case outlined
    }
}


