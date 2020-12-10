//
//  ContentView.swift
//  Shared
//
//  Created by Brando Lugo on 12/9/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var setGameViewModel: ShapeSetGame = ShapeSetGame()
    
    var body: some View {
        VStack {
            Grid(setGameViewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    setGameViewModel.choose(card: card)
                }
                .padding(5)
            }
        }
    }
}


struct CardView: View {
    //Get card using view model from the model
    var card: SetGame<String>.Card
    
    var body: some View {
        GeometryReader { geo in
            body(for: geo.size)
        }
    }
    
    @ViewBuilder
    func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify()
        }
    }
    
    private let fontScaleFactor: CGFloat = 0.35
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
