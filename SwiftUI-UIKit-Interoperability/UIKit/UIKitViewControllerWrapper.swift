//
//  UIKitViewControllerWrapper.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import SwiftUI
import UIKit

struct UIKitViewControllerWrapper: UIViewControllerRepresentable {
    
    @ObservedObject var pokemonVM: PokemonViewModel
    
    typealias UIViewControllerType = UINavigationController
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let viewController = PokemonTableViewController()
        viewController.pokemonVM = pokemonVM
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        navigationBarAppearance.backgroundColor = UIColor(named: "NavBarColor")
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        //
    }
    
}
