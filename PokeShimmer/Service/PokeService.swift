//
//  PokeService.swift
//  PokeShimmer
//
//  Created by lucas.lima on 05/03/21.
//  Copyright © 2021 lucas.lima. All rights reserved.
//

import Foundation

enum PokeError: Error {
    case badUrl
    case failedToDecode
    case failedToLoadImage
}

class PokeService {
    var pokeDataTask: URLSessionDataTask?
    var errorMessage = ""

    func fetchPokemons(from urlString: String, completion: @escaping (Result<Pokedex, PokeError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            guard let jsonData = data else { return }
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(Pokedex.self, from: jsonData)
                completion(.success(decoded))
            } catch {
                completion(.failure(.failedToDecode))
            }
        }
        task.resume()
    }
    
    func fetchImage(from urlString: String, completion: @escaping(Result<Data, PokeError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            guard let jsonData = data else {
                completion(.failure(.failedToLoadImage))
                return
            }
            completion(.success(jsonData))
        }
        task.resume()
    }
}
