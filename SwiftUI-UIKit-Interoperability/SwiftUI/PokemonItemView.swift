//
//  PokemonItemView.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import SwiftUI

struct PokemonItemView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            Image(uiImage: pokemon.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 100)
            
            
            VStack(alignment: .leading,spacing: 2) {
                
                Text(pokemon.title)
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(.black)
                
                Text(pokemon.description)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.trailing, 30)
    }
}

#Preview {
    PokemonItemView(pokemon: Pokemon.mock)
}
