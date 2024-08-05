//
//  SetGameApp.swift
//  SetGame
//
//  Created by Rubing on 8/1/24.
//

import SwiftUI

@main
struct SetGameApp: App {
    private let game = FirstSetGame()
    
    var body: some Scene {
        WindowGroup {
            FirstSetGameView(game: game)
        }
    }
}
