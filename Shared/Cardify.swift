//
//  Cardify.swift
//  SetApp
//
//  Created by Brando Lugo on 12/10/20.
//

import SwiftUI

struct Cardify: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWith)
                content
            }
        }
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWith: CGFloat = 3.0
}

extension View {
    func cardify() -> some View {
        self.modifier(Cardify())
    }
}

