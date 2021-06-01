//
//  WebService.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 1/06/21.
//

import Foundation

class WebService {
    func fetchPokemon(_ url: String, completion: @escaping (PokemonListModel) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = try JSONDecoder().decode(PokemonListModel.self, from: data)
                DispatchQueue.main.async {
                    completion(decoder)
                }
            } catch {
                
            }
        }
        task.resume()
    }
}
