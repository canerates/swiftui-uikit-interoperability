//
//  PokemonDetailView.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            Image(uiImage: pokemon.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
            Text(pokemon.description)
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.black)
                .multilineTextAlignment(.leading)
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 30)
        
        .navigationBarTitle(pokemon.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color("NavBarColor"), for: .navigationBar)
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.mock)
}
