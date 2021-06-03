//
//  WebService.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 1/06/21.
//

import Foundation

class WebService {
    func fetchPokemonList(_ url: String, completion: @escaping (PokemonListModel) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = try JSONDecoder().decode(PokemonListModel.self, from: data)
                DispatchQueue.main.async {
                    completion(decoder)
                }
            } catch {
                
            }
        }.resume()
    }

    func fetchPokemon(_ url: String, completion: @escaping (PokemonModel?) -> ()) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            let decoder = try? JSONDecoder().decode(PokemonModel.self, from: data)
            DispatchQueue.main.async {
                completion(decoder)
            }
        }.resume()
    }

    func fetchPokemonDetail(_ url: String, completion: @escaping (PokemonDetailModel?) -> ()) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }

            let decoder = try? JSONDecoder().decode(PokemonDetailModel.self, from: data)
            DispatchQueue.main.async {
                completion(decoder)
            }
        }.resume()
    }
}
