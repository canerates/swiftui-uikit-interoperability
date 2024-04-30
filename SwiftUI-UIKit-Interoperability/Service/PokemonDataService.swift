//
//  PokemonDataService.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import Foundation

enum NetworkError: Error {
    
    case badUrl
    case badRequest
    case badJSON
    case unsupportedImage
    
}

struct PokemonDataService {
    
    func fetchPokemons() async throws -> [Pokemon] {
        let urlString = "https://gist.githubusercontent.com/DavidCorrado/8912aa29d7c4a5fbf03993b32916d601/raw/681ef0b793ab444f2d81f04f605037fb44814125/pokemon.json"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.badUrl
        }
        
        var pokemons: [Pokemon] = []
        
        do {
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.badRequest
            }
            
            let responseData = try JSONDecoder().decode([Response].self, from: data)
            
            for item in responseData {
                if let image = try await ImageService.shared.fetchImage(with: item.imageUrl) {
                    pokemons.append(Pokemon(id: item.id, image: image, title: item.name, description: item.description))
                }
                
            }
            
        } catch {
            
            print("Error fetching pokemon list: \(error.localizedDescription)")
            throw NetworkError.badJSON
        }
        
        return pokemons
    }
}
