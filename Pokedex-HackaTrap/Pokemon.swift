//
//  Pokemon.swift
//  Pokedex-HackaTrap
//
//  Created by Michaud Reyna on 1/26/17.
//  Copyright © 2017 Michaud Reyna. All rights reserved.
//

import Foundation

class Pokemon{
    
    private var _name: String!
    private var _pokedexID: Int!
    
    var name: String{
        return _name
    }
    
    var pokedexID: Int{
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
    
}
