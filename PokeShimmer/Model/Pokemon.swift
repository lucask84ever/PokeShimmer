//
//  Pokemon.swift
//  PokeShimmer
//
//  Created by lucas.lima on 05/03/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let pokemon_species: PokeSpecie
    let entry_number: Int
    
    func getImageUrl() -> String {
        guard let baseURL = Config.imageURL.getValue() else { return "" }
        return "\(baseURL)\(String(format:"%03d", entry_number)).png"
    }
}

struct PokeSpecie: Decodable {
    let name: String
}
