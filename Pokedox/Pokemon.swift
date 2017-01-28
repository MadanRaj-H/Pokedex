//
//  Pokemon.swift
//  Pokedox
//
//  Created by mh53653 on 1/28/17.
//  Copyright © 2017 madan. All rights reserved.
//

import Foundation

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
    
    
    init(name : String, id : Int) {
        self._name = name
        self._pokemonId = id
    }
}
