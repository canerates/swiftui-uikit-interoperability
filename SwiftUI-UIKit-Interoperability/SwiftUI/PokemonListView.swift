//
//  PokemonListView.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import SwiftUI

struct PokemonListView: View {
    
    @EnvironmentObject var pokemonVM: PokemonViewModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 0) {
                ForEach(pokemonVM.pokemons, id: \.self) { pokemon in
                    
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                        PokemonItemView(pokemon: pokemon)
                    }
                }
            }
        }
        .padding(.bottom, 1) // It's a solution for the safe area bug
    }
}

#Preview {
    PokemonListView()
}
