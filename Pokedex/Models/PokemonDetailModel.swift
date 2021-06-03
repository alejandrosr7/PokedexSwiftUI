//
//  PokemonDetailModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 2/06/21.
//

import Foundation

struct PokemonDetailModel: Codable {
    var id: Int
    var name: String
    var weight: Int
    var height: Int
    var types: [Types]
    var moves: [Moves]
    var abilities: [Abilities]
    var sprites: Sprites
}
