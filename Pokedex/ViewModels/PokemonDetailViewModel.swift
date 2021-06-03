//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 2/06/21.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {

    var name = ""
    @Published var pokedexNumber = ""
    @Published var weight = ""
    @Published var height = ""
    @Published var sprites = ""
    @Published var officialArtwork = ""
    @Published var types = [Types]()
    @Published var abilities = [Abilities]()
    @Published var moves = [Moves]()
    
    func fetchPokemonDetail(with name: String) {
        WebService().fetchPokemonDetail(Constants.pokemonURL+name) { (pokemon) in
            self.pokedexNumber = String(pokemon.id)
            self.name = pokemon.name
            self.weight = String(pokemon.weight)
            self.height = String(pokemon.height)
            self.sprites = pokemon.sprites.front_default
            self.officialArtwork = pokemon.sprites.other.officialArtwork.front_default
            self.types = pokemon.types
            self.moves = pokemon.moves
            self.abilities = pokemon.abilities
        }
    }
}
