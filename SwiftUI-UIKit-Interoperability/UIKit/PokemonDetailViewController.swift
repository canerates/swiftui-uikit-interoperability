//
//  PokemonDetailViewController.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet var pokemonImage: UIImageView!
    
    @IBOutlet var pokemonDescriptionLabel: UILabel!
    
    var img: UIImage?
    var text: String?
//    var img = UIImage()
//    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        pokemonImage.image = img
        pokemonDescriptionLabel.text = text

    }

}
