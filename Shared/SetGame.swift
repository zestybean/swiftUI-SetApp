//
//  SetGame.swift
//  SetApp
//
//  Created by Brando Lugo on 12/10/20.
//

import Foundation

struct SetGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        //TODO: Add shuffle here
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


