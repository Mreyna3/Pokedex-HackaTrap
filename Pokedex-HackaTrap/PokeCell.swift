//
//  PokeCell.swift
//  Pokedex-HackaTrap
//
//  Created by Michaud Reyna on 2/2/17.
//  Copyright © 2017 Michaud Reyna. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {

    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        
    }
    
    func configureCell(poke: Pokemon){
        pokemon = poke
        
        nameLbl.text = pokemon.name.capitalized
        //thumbImg.image = UIImage(contentsOfFile: "\(pokemon.pokedexID)")
        thumbImg.image = UIImage(named: "\(pokemon.pokedexID)")
        
    }
    
}
