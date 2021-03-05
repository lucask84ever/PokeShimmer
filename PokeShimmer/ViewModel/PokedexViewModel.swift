//
//  PokedexViewModel.swift
//  PokeShimmer
//
//  Created by lucas.lima on 05/03/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import Foundation

protocol PokedexDelegate: AnyObject {
    func onSuccess()
    func onError(_ error: Error)
}

protocol PokemonDelegate {
    func onSuccess()
    func onError(_ error: Error)
}

class PokedexViewModel {
    private let service: PokeService
    private var pokedex: Pokedex?
    var delegate: PokedexDelegate?
    var pokeDelegate: PokemonDelegate?
    
    init() {
        self.service = PokeService()
    }
    
    func retrieveData() {
        service.fetchPokemons(from: Config.apiURL.getValue() ?? "") { [weak self] result in
            switch result {
                
            case .success(let pokedex):
                self?.pokedex = pokedex
                self?.delegate?.onSuccess()
            case .failure(let error):
                self?.delegate?.onError(error)
            }
        }
    }
    
    func getPokemons() -> [Pokemon] {
        return pokedex?.pokemons ?? []
    }
}
