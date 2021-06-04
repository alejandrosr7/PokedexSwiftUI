//
//  PokemonVoteViewModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 3/06/21.
//

import Foundation

class PokemonVoteViewModel: ObservableObject {

    @Published var pokemonCards = [PokemonVoteModel]()

    init() {
        createThePokemonCardArray()
    }

    func fetchPokemonVote() {
        WebService().fetchPokemonVoteDetail(Constants.pokemonURL + String(Int.random(in: 1..<1118))) { (pokemon) in
            if let pokemon = pokemon {
                let pokemonEntity = PokemonVoteModel(id: pokemon.id, name: pokemon.name, types: pokemon.types, sprites: pokemon.sprites)
                self.pokemonCards.append(pokemonEntity)
            }
        }
    }

    private func createThePokemonCardArray() {
        for _ in 1...3 {
            fetchPokemonVote()
        }
    }
}
