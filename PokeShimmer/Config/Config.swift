//
//  Config.swift
//  PokeShimmer
//
//  Created by lucas.lima on 05/03/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import Foundation

enum Config: String {
    case apiURL
    case imageURL
    case pokemonURL
    
    // Retrieve URL values from Plist File
    func getValue() -> String? {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
            let configDictionary = NSDictionary(contentsOfFile: path),
            let value = configDictionary.value(forKey: rawValue) as? String else {
            return nil
        }
        
        return value
    }
}
