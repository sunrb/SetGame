//
//  FirstSetGame.swift
//  SetGame
//
//  Created by Rubing on 8/2/24.
//

import SwiftUI

class FirstSetGame: ObservableObject {
    @Published private var model = createSetGame ()
    
    private static func createSetGame() -> SetGame {
        SetGame()
    }
    
    var deck: [Card] {
        model.deck
    }
    
    var table: [Card] {
        model.table
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func dealThreeMoreCard() {
        model.dealThreeMoreCard()
    }
    
    func newGame() {
        model = Self.createSetGame()
    }
}
