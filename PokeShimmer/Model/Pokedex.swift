//
//  Pokedex.swift
//  PokeShimmer
//
//  Created by lucas.lima on 05/03/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import Foundation

struct Pokedex: Decodable {
    var pokemons: [Pokemon]
}

extension Pokedex {
    enum CodingKeys: String, CodingKey {
        case pokemons = "pokemon_entries"
    }
}
