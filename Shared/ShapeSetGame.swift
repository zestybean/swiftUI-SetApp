//
//  ShapeSetGame.swift
//  SetApp
//
//  Created by Brando Lugo on 12/10/20.
//

import SwiftUI

class ShapeSetGame: ObservableObject {
    
    //Listen for changes in the model
    @Published private var setGameModel: SetGame<String> = ShapeSetGame.createSetGame()
    
    private static func createSetGame() -> SetGame<String> {
        let shapesArray: Array<String> = ["♦️", "🟩", "🟡"]
    
            return SetGame<String>(numberOfPairsOfCards: shapesArray.count) {
            pairIndex in
            return shapesArray[pairIndex]
        }
    }
    
    //MARK: - Access to the Model
    
    var cards: Array<SetGame<String>.Card> {
        return setGameModel.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(card: SetGame<String>.Card) {
        setGameModel.choose(card: card)
    }
}
