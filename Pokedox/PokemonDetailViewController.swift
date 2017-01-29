//
//  PokemonDetailViewController.swift
//  Pokedox
//
//  Created by mh53653 on 1/28/17.
//  Copyright © 2017 madan. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    var pokemon : Pokemon!;
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var describtionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokemonIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var currentImg: UIImageView!
    @IBOutlet weak var nextImg: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemon.downloadPokemonDetail { 
            self.updateUI()
        }
    }
    
    func updateUI(){
        self.weightLabel.text = pokemon.weight
        self.heightLabel.text = pokemon.height
        self.defenseLabel.text = pokemon.defense
        self.baseAttackLabel.text = pokemon.baseAttack
        self.typeLabel.text = pokemon.type
        self.mainImg.image = UIImage(named: "\(pokemon.pokemonId)")
        self.currentImg.image = UIImage(named: "\(pokemon.pokemonId)")
        self.pokemonIdLabel.text = "\(pokemon.pokemonId)"
        self.titleLabel.text = pokemon.name
        self.describtionLabel.text = pokemon.description
        
        if pokemon.evolutionTxt == "" {
            self.evoLabel.text = "No evolutions"
            self.nextImg.isHidden = true
        } else {
            self.nextImg.isHidden = false
            self.evoLabel.text = "NExt Evolution : \(pokemon.evolutionTxt) LVL : \(pokemon.evolutionLevel)"
            self.nextImg.image = UIImage(named: "\(pokemon.evolutionId)");
        }
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil);
    }
}
