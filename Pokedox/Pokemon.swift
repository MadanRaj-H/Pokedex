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
    
    init(name : String, id : Int) {
        self._name = name
        self._pokemonId = id
    }
}
