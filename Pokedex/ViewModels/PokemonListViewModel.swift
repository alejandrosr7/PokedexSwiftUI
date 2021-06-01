//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemonResults = [PokemonListResult]()

    init() {
        fetchPokemonList()
    }

    func fetchPokemonList() {
        guard let url = URL(string: Constants.pokemonListbaseURL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = try JSONDecoder().decode(PokemonListModel.self, from: data)
                DispatchQueue.main.async {
                    self.pokemonResults = decoder.results
                    
                    print(decoder.results[0].name)
                }
            } catch {
                
            }
        }
        task.resume()
    }
}
