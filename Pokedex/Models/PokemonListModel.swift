//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 31/05/21.
//

import Foundation

struct PokemonListModel: Codable {
    let next: String
    let count: Int
    let results: [PokemonListResult]
}

struct PokemonListResult: Codable, Hashable {
    let name: String
    let url: String
}
