//
//  SetGame.swift
//  SetGame
//
//  Created by Rubing on 8/2/24.
//

import Foundation
import SwiftUI

struct SetGame {
    
    private(set) var deck:  [Card]
    private(set) var table: [Card]
    
    private struct GameConstant {
        static let numberOfCardOnTable  = 12
        static let numberOfMatchCard    = 3
        static let numberOfDealCard     = 3
    }
    
    private var indexOfChosen: [Int] {
        get { table.indices.filter { table[$0].isChosen }}
    }
    
    private var isMatch: Bool {
        get {
            if indexOfChosen.count == GameConstant.numberOfMatchCard {
                let card1 = table[indexOfChosen[0]]
                let card2 = table[indexOfChosen[1]]
                let card3 = table[indexOfChosen[2]]

                let isSetOfNumberOfShape = (card1.numberOfShape == card2.numberOfShape && card1.numberOfShape == card3.numberOfShape) ||
                (card1.numberOfShape != card2.numberOfShape && card2.numberOfShape != card3.numberOfShape && card1.numberOfShape != card3.numberOfShape)
                
                let isSetOfColor = (card1.color == card2.color && card2.color == card3.color) ||
                (card1.color != card2.color && card2.color != card3.color && card1.color != card3.color)
                
                let isSetOfShading = (card1.shading == card2.shading && card2.shading == card3.shading) ||
                (card1.shading != card2.shading && card2.shading != card3.shading && card1.shading != card3.shading)
                
                let isSetOfShape = (card1.shape == card2.shape && card2.shape == card3.shape) ||
                (card1.shape != card2.shape && card2.shape != card3.shape && card1.shape != card3.shape)
                
                return isSetOfNumberOfShape && isSetOfColor && isSetOfShape && isSetOfShading
            } else {
                return false
            }
        }
    }
    
    init() {
        deck = []
        var id = 0
        
        for shape in Card.CardShape.allCases {
            for shading in Card.CardShading.allCases {
                for color in Card.CardColor.allCases {
                    for number in 1 ... 3 {
                        deck.append(Card(id: id, shape: shape, color: color, numberOfShape: number, shading: shading))
                        id += 1
                    }
                }
            }
        }
        deck.shuffle()
        
        table = []
        for _ in 0 ..< GameConstant.numberOfCardOnTable {
            table.append(deck.popLast()!)
        }
    }
    
    mutating func choose(_ card: Card) {
        if indexOfChosen.count == GameConstant.numberOfMatchCard {
            if isMatch {
                replaceNewCard()
            }
            table.indices.forEach {
                table[$0].isChosen = false
                table[$0].isSet = nil
            }
        }
        
        if let chosenIndex = table.firstIndex(where: { $0.id == card.id }) {
            table[chosenIndex].isChosen.toggle()
            if indexOfChosen.count == GameConstant.numberOfMatchCard {
                let isMatch = isMatch
                indexOfChosen.forEach( { i in
                    table[i].isSet = isMatch
                })
            }
        }
    }
    
    private mutating func replaceNewCard() {
        indexOfChosen.reversed().forEach( { i in
            table.remove(at: i)
            if !deck.isEmpty {
                table.insert(deck.popLast()!, at: i)
            }
        })
    }
    
    mutating func dealThreeMoreCard() {
        if indexOfChosen.count == GameConstant.numberOfMatchCard {
            if isMatch {
                replaceNewCard()
                return
            }
        }
        for _ in 0 ..< GameConstant.numberOfDealCard {
            table.append(deck.popLast()!)
        }
    }
}


