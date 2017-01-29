//
//  Pokemon.swift
//  Pokedox
//
//  Created by mh53653 on 1/28/17.
//  Copyright © 2017 madan. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name : String!
    private var _pokemonId : Int!
    private var _description : String!
    private var _type : String!
    private var _defense : String!
    private var _height : String!
    private var _weight : String!
    private var _baseAttack : String!
    private var _evolutionTxt : String!
    private var _evolutionLevel : String!
    private var _evolutionId : String!
    private var _pokemonURL : String!
    
    var name : String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    
    var pokemonId : Int {
        if _pokemonId == nil{
            _pokemonId = 0
        }
        return _pokemonId
    }
    
    var description : String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type : String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense : String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height : String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight : String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var baseAttack : String {
        if _baseAttack == nil {
            _baseAttack = ""
        }
        return _baseAttack
    }
    
    var evolutionTxt : String {
        if _evolutionTxt == nil {
            _evolutionTxt = ""
        }
        return _evolutionTxt
    }
    
    
    var evolutionId : String {
        if _evolutionId == nil {
            _evolutionId = ""
        }
        return _evolutionId
    }
    
    var evolutionLevel : String {
        if _evolutionLevel == nil {
            _evolutionLevel = ""
        }
        return _evolutionLevel
    }
    
    init(name : String, id : Int) {
        self._name = name
        self._pokemonId = id
        self._pokemonURL = "\(BASE_URL)\(POKEMON_URL)\(self.pokemonId)/"
    }
    
    
    func downloadPokemonDetail(completed : @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            if let dict = response.result.value as? Dictionary<String,AnyObject> {
                if let weight = dict["weight"] as? String{
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String{
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int{
                    self._baseAttack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int{
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String,String>] , types.count > 0 {
                    if let name = types[0]["name"]  {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                }
                
                if let descriptions = dict["descriptions"] as? [Dictionary<String,String>] , descriptions.count >  0 {
                    if let url = descriptions[0]["resource_uri"] {
                        let newURL = "\(BASE_URL)\(url)"
                        Alamofire.request(newURL).responseJSON(completionHandler: { (response) in
                            if let descriptionObj = response.result.value as? Dictionary<String,AnyObject> {
                                if let description = descriptionObj["description"] as? String {
                                    self._description = description
                                }
                            }
                            completed()
                        })
                    }
                }
                
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String,AnyObject>] , evolutions.count > 0 {
                    if let evo = evolutions[0]["to"] as? String {
                        if evo.range(of: "mega") == nil {
                            self._evolutionTxt = evo.capitalized
                            
                            if let level = evolutions[0]["level"] as? Int {
                                self._evolutionLevel = "\(level)"
                            }
                            
                            if let id  = evolutions[0]["resource_uri"] as? String {
                                let removeOthers = id.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let evoid = removeOthers.replacingOccurrences(of: "/", with: "")
                                self._evolutionId = evoid
                            }
                            
                        }
                    }
                }
            }
            completed()
        }
    }
}
