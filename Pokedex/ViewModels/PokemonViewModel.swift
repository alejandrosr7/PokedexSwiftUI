//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 1/06/21.
//

import Foundation

class PokemonViewModel: ObservableObject {

    @Published var pokedexNumber = 0
    @Published var name = ""
    @Published var sprites = ""
    @Published var types = [Types]()
    @Published var abilities = [Abilities]()
    

    func fetchPokemon(with name: String, urlBase: String) {
        WebService().fetchPokemon(urlBase) { (pokemon) in
            self.pokedexNumber = pokemon.id
            self.name = pokemon.name
            self.sprites = pokemon.sprites.front_default
            self.types = pokemon.types
            self.abilities = pokemon.abilities
        }
    }
}
