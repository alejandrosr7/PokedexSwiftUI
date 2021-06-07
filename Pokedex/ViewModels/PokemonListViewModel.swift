//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemonResults = [PokemonListResult]()
    @Published var previous = ""
    @Published var nextSearch = ""
    @Published var count = 0

    init() {
        fetchPokemonList(urlString: Constants.pokemonListbaseURL)
    }

    func fetchPokemonList(urlString: String) {
        WebService().fetchPokemonList(urlString) { (decoder) in
            self.pokemonResults = decoder.results
            self.previous = decoder.previous ?? ""
            self.nextSearch = decoder.next ?? ""
            self.count = decoder.count
        }
    }
}
