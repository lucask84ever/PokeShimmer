//
//  PokemonCollectionViewCell.swift
//  PokeShimmer
//
//  Created by lucas.lima on 05/03/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cellBackgroundView.layer.cornerRadius = 16
        cellBackgroundView.layer.borderColor = UIColor.black.cgColor
        cellBackgroundView.layer.borderWidth = 2
    }
    
    func setup(with pokemon: Pokemon) {
        pokeNameLabel.text = "\(String(format: "%03d", pokemon.entry_number)) - \(pokemon.pokemon_species.name.capitalized)"
        pokeImageView.downloadImage(from: pokemon.getImageUrl())
    }

}
