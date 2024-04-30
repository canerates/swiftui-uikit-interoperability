//
//  PokemonViewModel.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    private let service = PokemonDataService()
    
    init() {
        fetchPokemons()
    }
    
    func fetchPokemons() {
        Task {
            self.pokemons = try await service.fetchPokemons()
        }
    }
}
