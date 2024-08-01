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
                <#code#>
            case .outlined:
                <#code#>
            }
        case .oval:
            <#code#>
        case .squiggle:
            <#code#>
        }
        
    }
}

#Preview {
    CardView()
}
