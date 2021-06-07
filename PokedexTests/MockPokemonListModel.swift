//
//  MockPokemonListModel.swift
//  PokedexTests
//
//  Created by Alejandro Serna Rodriguez on 7/06/21.
//

import Foundation
@testable import Pokedex

extension PokemonListModel {

    static func with(next: String = "https://pokeapi.co/api/v2/pokemon?offset=10&limit=10", previous: String? = nil, count: Int = 1118, results: [PokemonListResult] = [PokemonListResult(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"), PokemonListResult(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/")]) -> PokemonListModel {
        return PokemonListModel(next: next, previous: previous, count: count, results: results)
    }
}
