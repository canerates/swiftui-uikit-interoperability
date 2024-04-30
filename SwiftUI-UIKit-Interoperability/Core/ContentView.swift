//
//  ContentView.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pokemonVM: PokemonViewModel = PokemonViewModel()
    @State private var selection = 0
    
    var body: some View {
        
        ZStack {
            
            if selection == 0 {
                SwiftUIView()
                    .environmentObject(pokemonVM)
            } else {
                UIKitViewControllerWrapper(pokemonVM: pokemonVM)
                    .edgesIgnoringSafeArea(.all)
                
            }
            
            VStack {
                Spacer()
                
                picker
                
            }
        }
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    
    var picker: some View {
        Picker(selection: $selection, label: Text("Select a view")) {
            Text("SwiftUI").tag(0)
            Text("UIKit").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .background(Color("NavBarColor").cornerRadius(5))
        .padding()
    }
    
}
