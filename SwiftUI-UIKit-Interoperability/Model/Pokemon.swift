//
//  Pokemon.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import SwiftUI

struct Pokemon: Hashable {
    
    let id: Int
    let image: UIImage
    let title: String
    let description: String
    
    static var mock: Pokemon = Pokemon(id: 1, image: UIImage(named: "1")!, title: "Bulbasaur", description: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.")
    
}
