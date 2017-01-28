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
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil);
    }
}
