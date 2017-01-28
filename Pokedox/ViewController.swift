//
//  ViewController.swift
//  Pokedox
//
//  Created by mh53653 on 1/28/17.
//  Copyright © 2017 madan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection : UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var searchmode = false
    var musicPlayer : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        parsePokemonCSV()
        initAudio()
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    
    func initAudio(){
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func parsePokemonCSV() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        do {
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            
            for row in rows {
                let name = row["identifier"]!
                let pokeId = Int(row["id"]!)
                
                let pokemon = Pokemon(name: name, id: pokeId!)
                self.pokemon.append(pokemon)
            }
        } catch let err as NSError {
            print(err.description)
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchmode{
            return filteredPokemon.count
        }
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCell{
            if searchmode {
                let pokemon = self.filteredPokemon[indexPath.row]
                cell.configureCell(pokemon: pokemon)
            } else {
                let pokemon = self.pokemon[indexPath.row]
                cell.configureCell(pokemon: pokemon)
            }
            return cell
        } else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var poke : Pokemon!
        if searchmode {
            poke = filteredPokemon[indexPath.row]
        } else
        {
            poke = pokemon[indexPath.row]
        }
        performSegue(withIdentifier: "PokemonDetailViewController", sender: poke)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailViewController" {
            if let detailsVC  = segue.destination as? PokemonDetailViewController {
                if let poke = sender as? Pokemon {
                    detailsVC.pokemon = poke;
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }

    @IBAction func musicBtnressed(_ sender: UIButton) {
        if musicPlayer.isPlaying {
            musicPlayer.pause()
            sender.alpha = 0.2
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
        
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            searchmode = false
            collection.reloadData()
            view.endEditing(true)
        } else {
            let lower = searchBar.text?.lowercased();
            self.filteredPokemon = self.pokemon.filter({$0.name.range(of: lower!) != nil})
            searchmode = true
            collection.reloadData()
        }
    }
}

