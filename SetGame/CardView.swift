//
//  ContentView.swift
//  SetGame
//
//  Created by Rubing on 8/1/24.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lindWidth)
                
                VStack {
                    ForEach(0 ..< card.numberOfShape, id: \.self) { _ in
                        cardShape
                            .frame(width: geometry.size.width/2, height: geometry.size.height/6)
                    }
                }.foregroundColor(cardColor)
                if card.isSelected {
                    shape.foregroundColor(.gray).opacity(0.5)
                }
                if let isMatched = card.isSet {
                    shape.foregroundColor(isMatched ? .green : .red).opacity(0.6)
                }
            }
        })
    }
    
    @ViewBuilder
    
    private var cardShape: some View {
        switch card.shape {
        case .diamond:
            switch card.shading {
            case .solid:
                Diamond()
            case .striped:
                Diamond().opacity(0.5)
            case .outlined:
                Diamond().stroke()
            }
        case .oval:
            switch card.shading {
            case .solid:
                Capsule()
            case .striped:
                Capsule().opacity(0.5)
            case .outlined:
                Capsule().stroke()
            }
        case .squiggle:
            switch card.shading {
            case .solid:
                Squiggle()
            case .striped:
                Squiggle().opacity(0.5)
            case .outlined:
                Squiggle().stroke()
            }
        }
    }
    
    private var cardColor: Color {
        switch card.color {
        case .red:
            return .red
        case .purple:
            return .purple
        case .green:
            return .green
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lindWidth: CGFloat = 3
    }
}

//#Preview {
//    let card = Card(id: 1, shape: Card.CardShape.diamond, color: Card.CardColor.purple, numberOfShape: 3, shading: Card.CardShading.solid)
//    CardView(card: card)
//        .frame(width: 200, height: 200)
//}
