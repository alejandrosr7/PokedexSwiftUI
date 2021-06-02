//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Alejandro Serna Rodriguez on 1/06/21.
//

import Foundation

struct PokemonModel: Codable {
    var id: Int
    var name: String
    var weight: Int
    var height: Int
    var types: [Types]
    var moves: [Moves]
    var abilities: [Abilities]
    var sprites: Sprites
}

struct Type: Codable {
    var name: String
}

struct Types: Codable {
    var type: Type
}

struct Move: Codable {
    var name: String
}

struct Moves: Codable {
    var move: Move
}

struct Ability: Codable {
    var name: String
}

struct Abilities: Codable {
    var ability: Ability
}

struct Sprites: Codable {
    var front_default: String
}

struct Other {
    var officialArtwork: OfficialArtwork
}

struct OfficialArtwork {
    var front_default: String
}
