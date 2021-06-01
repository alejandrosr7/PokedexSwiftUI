//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemonResults = [PokemonListResult]()
    @Published var nextSearch = ""
    @Published var previousSearch = ""

    init() {
        fetchPokemonList(urlString: Constants.pokemonListbaseURL)
    }

    func fetchPokemonList(urlString: String) {
        WebService().fetchPokemon(urlString) { (decoder) in
            self.pokemonResults = decoder.results
            self.nextSearch = decoder.next
            self.previousSearch = decoder.previous ?? ""
        }
    }
}
