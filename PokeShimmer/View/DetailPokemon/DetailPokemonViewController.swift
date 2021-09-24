//
//  DetailPokemonViewController.swift
//  PokeShimmer
//
//  Created by lucas.silva on 24/09/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import UIKit

class DetailPokemonViewController: UIViewController {
    var viewModel: DetailPokemonViewModel? = nil
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        descriptionLabel.text = viewModel?.pokemon.pokemon_species.name
        imageLabel.downloadImage(from: viewModel?.pokemon.getImageUrl())
    }

}
