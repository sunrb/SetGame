//
//  FirstSetGameViewe.swift
//  SetGame
//
//  Created by Rubing on 8/5/24.
//

import SwiftUI

struct FirstSetGameView: View {
    @ObservedObject var game: FirstSetGame
    
    var body: some View {
        VStack {
            HStack {
                Button("New Game") {
                    game.newGame()
                }
            }
            AspectVGrid(items: game.table, aspectRatio: 2/3, content: { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            })
            HStack {
                Button("Add 3 More Cards") {
                    game.dealThreeMoreCard()
                }.disabled(game.deck.isEmpty)
            }
        }
        .background()
        .padding(.horizontal)
    }
}

#Preview {
    FirstSetGameView(game: FirstSetGame())
}
