//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 1/06/21.
//

import Foundation

class PokemonViewModel: ObservableObject {

    @Published var name = ""
    @Published var sprites = ""
    @Published var types = [Types]()

    func fetchPokemon(with name: String) {
        WebService().fetchPokemon(Constants.pokemonURL+name) { (pokemon) in
            if let pokemon = pokemon {
                self.name = pokemon.name
                self.sprites = pokemon.sprites.front_default
                self.types = pokemon.types
            }
        }
    }
}
