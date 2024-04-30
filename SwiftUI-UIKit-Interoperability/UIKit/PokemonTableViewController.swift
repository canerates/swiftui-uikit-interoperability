//
//  PokemonTableViewController.swift
//  SwiftUI-UIKit-Interoperability
//
//  Created by Caner Ates on 30.04.2024.
//

import UIKit

class PokemonTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var pokemonTable: UITableView!
    
    var pokemonVM: PokemonViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokémon"
        
        let nib = UINib(nibName: "PokemonCell", bundle: nil)
        pokemonTable.register(nib, forCellReuseIdentifier: "PokemonCell")
        pokemonTable.backgroundColor = .white
        pokemonTable.separatorStyle = .none
        
        pokemonTable.delegate = self
        pokemonTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonVM.pokemons.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        cell.selectionStyle = .none
        
        let pokemon = pokemonVM.pokemons[indexPath.row]
        
        cell.pokemonImage.image = pokemon.image
        cell.pokemonTitleLabel.text = pokemon.title
        cell.pokemonDescriptionLabel.text = pokemon.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemonVM.pokemons[indexPath.row]
        let detailVC = PokemonDetailViewController()
        detailVC.img = pokemon.image
        detailVC.text = pokemon.description
        detailVC.title = pokemon.title
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}
