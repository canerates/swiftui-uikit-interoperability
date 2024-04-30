//
//  SwiftUIView.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import SwiftUI

struct SwiftUIView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                PokemonListView()
            }
            .navigationBarTitle("Pokémon")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color("NavBarColor"), for: .navigationBar)
        }
    }
}

#Preview {
    SwiftUIView()
}
